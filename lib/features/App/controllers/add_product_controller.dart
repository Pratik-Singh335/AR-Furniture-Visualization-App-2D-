import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:myapp/data/api_keys.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';
import 'package:myapp/data/services/supabase_services.dart';
import 'package:myapp/features/App/models/product_model.dart';
import 'package:myapp/features/authentication/controllers/user_controller.dart';

class AddProductController extends GetxController {
  static AddProductController get instance => Get.find<AddProductController>();

  // -- Storage (Supabase)
  final storage = SupabaseServices.instance.storage;
  final supabase = SupabaseServices.instance;

  //-- Image Picker
  final ImagePicker picker = ImagePicker();

  // -- OBS Variable
  // Rx<File?> pickedImage = Rx<File?>(null);
  RxList<File> pickedImages = <File>[].obs;
  RxBool isLoading = false.obs;

  GlobalKey<FormState> productAddFormKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descController = TextEditingController();
  RxString productCategory = ''.obs;

  // -- Add Product in DB
  Future<void> addProductToDB() async {
    if (!productAddFormKey.currentState!.validate()) return;

    if (pickedImages.isEmpty) {
      return MHelperFunctions.showSnackBar(
        iconColor: red,
        icon: Icons.cancel,
        text: "Pick at least One Image",
      );
    }

    if (productCategory.value.isEmpty) {
      return MHelperFunctions.showSnackBar(
        iconColor: red,
        icon: Icons.cancel,
        text: 'Select Category',
      );
    }

    isLoading.value = true;
    List<String> imageUrls = [];

    for (var image in pickedImages) {
      String? imageURL = await removeBG(image);

      if (imageURL == null) {
        MHelperFunctions.showSnackBar(
          icon: Icons.cancel,
          text: "Couldn't remove BG",
          iconColor: red,
        );

        final filePath = 'images/${DateTime.now().millisecondsSinceEpoch}.jpg';
        await storage.from('products').upload(filePath, image);
        imageURL = storage.from('products').getPublicUrl(filePath);
      }

      imageUrls.add(imageURL);
    }

    final newProduct = ProductModel(
      quantity: 0.obs,
      image: imageUrls,
      name: nameController.text.trim(),
      price: priceController.text.trim(),
      category: productCategory.value.trim(),
      description: descController.text.trim(),
      sellerID: UserController.instance.user.value.id!,
    );

    // -- Add Product to Supabase
    await supabase.create(newProduct.toJson(), supabase.productsTable);

    // -- Clear Fields
    pickedImages.clear();
    nameController.clear();
    priceController.clear();
    descController.clear();
    productCategory.value = '';

    // -- Show Success Message
    MHelperFunctions.showSnackBar(
        icon: Icons.check_circle, text: "Added Successfully", iconColor: green);

    Get.back();
    isLoading.value = false;
  }

  // -- Pick From Camera
  Future<void> pickFromCamera() async => await imagePicker(ImageSource.camera);

  // -- Pick From Gallery
  Future<void> pickFromGalery() async => await imagePicker(ImageSource.gallery);

  // -- Image Picker
  Future<void> imagePicker(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      pickedImages.add(File(image.path));
    }

    return;
  }

  // -- Show Image Source Options
  void imageSourceOptions() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MSizes.cardRadiusLg)),
        titlePadding: const EdgeInsets.only(top: 12, bottom: 6),
        title: const Text("Pick From", textAlign: TextAlign.center),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // -- From Camera
            GestureDetector(
              onTap: () {
                pickFromCamera();
                Get.back();
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.camera_alt, size: 40, color: primaryColor),
                  const Text('Camera'),
                ],
              ),
            ),

            // -- From Gallery
            GestureDetector(
              onTap: () {
                pickFromGalery();
                Get.back();
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.photo_library, size: 40, color: primaryColor),
                  const Text('Gallery'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // -- Remove Image BG
  Future<String?> removeBG(File imageFile) async {
    try {
      final request = http.MultipartRequest(
          'POST', Uri.parse('https://api.remove.bg/v1.0/removebg'));
      request.headers['X-Api-Key'] = ApiKeys.removeBG;
      request.files
          .add(await http.MultipartFile.fromPath('image_file', imageFile.path));

      final response = await request.send();

      if (response.statusCode != 200) {
        return null;
      }

      final Uint8List imageData = await response.stream.toBytes();
      final filePath = 'images/${DateTime.now().millisecondsSinceEpoch}.png';

      // -- Add Removed BG Image To Database
      await storage.from('products').uploadBinary(filePath, imageData);

      // -- Get it's Public URL
      return storage.from('products').getPublicUrl(filePath);
    } catch (e) {
      return null;
    }
  }
}

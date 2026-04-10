import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:myapp/features/App/screens/add_product/widgets/add_image_screen.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/validators/validation.dart';
import 'package:myapp/features/App/controllers/add_product_controller.dart';
import 'package:myapp/features/App/screens/add_product/widgets/image_container.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddProductController.instance;
    return Scaffold(
      backgroundColor: bgColor,

      // -- AppBar
      appBar: AppBar(centerTitle: true, title: const Text('Add Product')),

      // -- Body
      body: Padding(
        padding: const EdgeInsets.all(MSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: MSizes.spaceBtwSections),

              // -- Picked Image (Will Show Here)
              MImageContainer(
                onPress: () => Get.to(
                  duration: const Duration(milliseconds: 350),
                  transition: Transition.rightToLeft,
                  () => const AddImageScreen(),
                ),
              ),
              const SizedBox(height: MSizes.spaceBtwSections),

              // -- Form
              Form(
                key: controller.productAddFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // -- Name (Field)
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: controller.nameController,
                      validator: (value) =>
                          MValidator.validateEmptyText('Name', value),
                      onTapOutside: (_) =>
                          FocusManager.instance.primaryFocus!.unfocus(),
                      decoration: const InputDecoration(hintText: 'Name'),
                    ),
                    const SizedBox(height: MSizes.spaceBtwInputFields),

                    // -- Price (Field)
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.priceController,
                      validator: (value) =>
                          MValidator.validateEmptyText('Price', value),
                      onTapOutside: (_) =>
                          FocusManager.instance.primaryFocus!.unfocus(),
                      decoration: const InputDecoration(hintText: 'Price'),
                    ),
                    const SizedBox(height: MSizes.spaceBtwInputFields),

                    // -- Description (Field)
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 300.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: controller.descController,
                        validator: (value) =>
                            MValidator.validateEmptyText('Description', value),
                        onTapOutside: (_) =>
                            FocusManager.instance.primaryFocus!.unfocus(),
                        decoration:
                            const InputDecoration(hintText: 'Description'),
                        maxLines: null,
                      ),
                    ),
                    const SizedBox(height: MSizes.spaceBtwInputFields),

                    // -- Category
                    DropdownButtonFormField(
                        hint: const Text('Category'),
                        items: ['sofa', 'chair', 'table', 'other']
                            .map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(item.capitalize!),
                                ))
                            .toList(),
                        onChanged: (value) {
                          controller.productCategory.value = value!;
                        }),
                  ],
                ),
              ),
              const SizedBox(height: MSizes.spaceBtwSections),

              // -- Add to Database (Button)
              SizedBox(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(MSizes.borderRadiusMd)),
                      backgroundColor: primaryColor),

                  // -- Add Product in DataBase
                  onPressed: controller.addProductToDB,

                  // -- (Condition)
                  child: Obx(() => controller.isLoading.value
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: white,
                            strokeCap: StrokeCap.round,
                            strokeWidth: 2.5,
                          ),
                        )
                      : Text(
                          'Add',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .apply(color: white),
                        )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

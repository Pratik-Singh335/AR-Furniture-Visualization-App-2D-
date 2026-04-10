import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/common/widgets/layouts/grid_layout.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/features/App/controllers/add_product_controller.dart';

class AddImageScreen extends StatelessWidget {
  const AddImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddProductController.instance;

    return Scaffold(
      backgroundColor: bgColor,

      // -- AppBar
      appBar: AppBar(centerTitle: true, title: const Text('Add Images')),

      // -- Body
      body: Obx(() {
        return MGridLayout(
          mainAxisExtent: 160,
          itemCount: controller.pickedImages.length,
          itemBuilder: (context, index) {
            final image = controller.pickedImages[index];

            return Stack(
              fit: StackFit.expand,
              children: [
                // -- Picked Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(MSizes.cardRadiusLg),
                  child: Image.file(image, fit: BoxFit.cover),
                ),

                // -- Remove Icon
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => controller.pickedImages.remove(image),
                    child: Padding(
                      padding: const EdgeInsets.all(MSizes.sm),
                      child: CircleAvatar(
                        backgroundColor: primaryColor,
                        radius: 10,
                        child: const Icon(Icons.remove,
                            color: white, size: MSizes.iconSm),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        );
      }),

      // -- Add Image Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () => controller.imageSourceOptions(),
        child: const Icon(Icons.add, color: white),
      ),
    );
  }
}

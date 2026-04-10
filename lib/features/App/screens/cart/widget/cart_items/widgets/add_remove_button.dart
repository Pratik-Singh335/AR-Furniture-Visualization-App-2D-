import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/common/widgets/icons/circular_icon.dart';
import 'package:myapp/features/App/controllers/product_controller.dart';
import 'package:myapp/features/App/models/product_model.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/sizes.dart';

class MProductAddRemoveButtons extends StatelessWidget {
  final ProductModel product;

  const MProductAddRemoveButtons({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    return SizedBox(
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // -- Remove Button
          MCircularIcon(
            height: 24,
            width: 24,
            onPress: () => controller.onRemove(product),
            iconColor: white,
            bgColor: primaryColor,
            icon: Iconsax.minus,
            size: MSizes.md,
          ),
          const SizedBox(width: MSizes.spaceBtwItems),

          // -- Quantity
          Obx(
            () => Text(
              product.quantity.toString(),
              style:
                  Theme.of(context).textTheme.titleLarge!.apply(color: black),
            ),
          ),

          const SizedBox(width: MSizes.spaceBtwItems),

          // -- Add Button
          MCircularIcon(
            height: 24,
            width: 24,
            onPress: () => controller.onAdd(product),
            iconColor: white,
            bgColor: primaryColor,
            icon: Iconsax.add,
            size: MSizes.md,
          )
        ],
      ),
    );
  }
}

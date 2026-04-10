import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/features/App/controllers/product_controller.dart';
import 'package:myapp/features/App/screens/cart/widget/cart_items/widgets/cart_item_widget.dart';
import 'package:myapp/utils/constants/sizes.dart';

class MCartItems extends StatelessWidget {
  final bool showQuantity;
  const MCartItems({
    super.key,
    this.showQuantity = true,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: ProductController.instance.cartItems.length,
          separatorBuilder: (_, __) =>
              const SizedBox(height: MSizes.spaceBtwSections),
          itemBuilder: (_, index) {
            return MCartItemWidget(
              product: ProductController.instance.cartItems[index],
              showQuantity: showQuantity,
            );
          },
        ));
  }
}

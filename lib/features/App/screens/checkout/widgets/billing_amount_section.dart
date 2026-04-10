import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/features/App/controllers/product_controller.dart';
import 'package:myapp/utils/constants/sizes.dart';

class MBillingAmountSection extends StatelessWidget {
  const MBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Obx(
              () => Text('₹${ProductController.instance.cartSubtotal}',
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          ],
        ),
        const SizedBox(height: MSizes.spaceBtwItems / 2),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('₹150.0', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: MSizes.spaceBtwItems / 2),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('₹80.0', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: MSizes.spaceBtwItems / 2),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Obx(
              () => Text('₹${ProductController.instance.cartTotal}',
                  style: Theme.of(context).textTheme.titleMedium),
            )
          ],
        ),
      ],
    );
  }
}

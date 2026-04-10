import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:myapp/common/widgets/text/product_title_text.dart';
import 'package:myapp/features/App/models/product_model.dart';
import 'package:myapp/features/App/screens/cart/widget/cart_items/widgets/add_remove_button.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/sizes.dart';

class MCartItemWidget extends StatelessWidget {
  final bool showQuantity;
  const MCartItemWidget(
      {super.key, required this.product, required this.showQuantity});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // -- Product Image
        MRoundedContainer(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(MSizes.xs),
          bgColor: white,
          child: Center(child: Image.network(product.image[0])),
        ),
        const SizedBox(width: MSizes.spaceBtwItems),

        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -- Product Name
              Flexible(
                child: MProductTitleText(title: product.name, maxLines: 1),
              ),

              if (showQuantity) ...[
                const SizedBox(height: MSizes.xs),

                // -- Product Add & Remove Quantitu Buttons
                MProductAddRemoveButtons(product: product)
              ]
            ],
          ),
        ),

        // -- Show Selected Quantity
        if (!showQuantity)
          Expanded(
            child: Text('${product.quantity.value}x',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .apply(color: black)),
          ),

        // -- Price
        Obx(() {
          final price = (double.parse(product.price) * product.quantity.value)
              .toStringAsFixed(0);
          return Text(
            "₹ $price",
            style:
                Theme.of(context).textTheme.headlineSmall!.apply(color: black),
          );
        })
      ],
    );
  }
}

/** */
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:myapp/features/App/controllers/product_controller.dart';
import 'package:myapp/features/authentication/controllers/user_controller.dart';
import 'package:myapp/utils/constants/fonts.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/features/App/models/product_model.dart';
import 'package:myapp/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:augmented_reality_plugin/augmented_reality_plugin.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';

class MVirtualViewButton extends StatelessWidget {
  const MVirtualViewButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isCustomer =
        UserController.instance.user.value.accountType == 'customer';

    return Row(
      mainAxisAlignment: isCustomer
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.center,
      children: [
        // --  Virtual View (Button)
        GestureDetector(
          onTap: () => Get.to(() => AugmentedRealityPlugin(product.image[0])),
          child: MRoundedContainer(
            height: 60,
            width: isCustomer
                ? 150
                : MHelperFunctions.screenSize(context).width * .85,
            bgColor: white.withOpacity(0.2),
            child: Center(
              child: Text(
                'Virtual View',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .apply(fontFamily: MFonts.outfitMedium, color: white),
              ),
            ),
          ),
        ),

        // -- Add to Cart (Button)
        if (isCustomer)
          GestureDetector(
            onTap: () => ProductController.instance.addToCart(product),
            child: MRoundedContainer(
              height: 60,
              width: 150,
              bgColor: white.withOpacity(0.2),
              child: Center(
                child: Text(
                  'Add to Cart',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .apply(fontFamily: MFonts.outfitMedium, color: white),
                ),
              ),
            ),
          )
      ],
    );
  }
}

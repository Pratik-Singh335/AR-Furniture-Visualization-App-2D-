import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:myapp/features/App/controllers/product_controller.dart';
import 'package:myapp/features/App/screens/cart/widget/app_bar/cart_app_bar.dart';
import 'package:myapp/features/App/screens/cart/widget/cart_items/cart_items.dart';
import 'package:myapp/features/App/screens/checkout/checkout.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // -- AppBar
        appBar: const MCartAppBar(),

        // -- Body
        body: const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MSizes.defaultSpace, vertical: MSizes.defaultSpace),
          child: MCartItems(),
        ),

        // -- Checkout (Button)
        bottomNavigationBar: GestureDetector(
          onTap: () {
            ProductController.instance.generateBill();
            Get.to(() => const CheckoutScreen());
          },
          child: MRoundedContainer(
            radius: 0,
            height: 55,
            width: double.infinity,
            bgColor: primaryColor,
            child: Center(
                child: Text(
              'Checkout',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: white),
            )),
          ),
        ));
  }
}

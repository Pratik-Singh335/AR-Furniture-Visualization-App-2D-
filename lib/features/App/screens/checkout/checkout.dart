import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/auth_gate.dart';
import 'package:myapp/common/widgets/appBar/app_bar.dart';
import 'package:myapp/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:myapp/common/widgets/icons/back_icon_container.dart';
import 'package:myapp/common/widgets/success_screen.dart/success_screen.dart';
import 'package:myapp/features/App/controllers/product_controller.dart';
import 'package:myapp/features/App/screens/cart/widget/cart_items/cart_items.dart';
import 'package:myapp/features/App/screens/checkout/widgets/billing_address_section.dart';
import 'package:myapp/features/App/screens/checkout/widgets/billing_amount_section.dart';
import 'package:myapp/features/App/screens/checkout/widgets/billing_payement_section.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/fonts.dart';
import 'package:myapp/utils/constants/image_strings.dart';
import 'package:myapp/utils/constants/sizes.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // -- Appbar
      appBar: MAppBar(
        centreTitle: true,
        leadingIcon: MBackIconContainer(
            bgColor: primaryColor,
            margin: const EdgeInsets.all(MSizes.sm * 1.2)),
        title: Text('Order Review',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(fontFamily: MFonts.outfitBold, color: black)),
      ),

      // -- Body
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Items in Cart
              MCartItems(showQuantity: false),
              SizedBox(height: MSizes.spaceBtwSections),

              /// -- Billing Section
              MRoundedContainer(
                padding: EdgeInsets.all(MSizes.md),
                showBorder: true,
                bgColor: white,
                child: Column(
                  children: [
                    /// Pricing
                    MBillingAmountSection(),
                    SizedBox(height: MSizes.spaceBtwItems),

                    /// Divider
                    Divider(),
                    SizedBox(height: MSizes.spaceBtwItems),

                    /// Payement Methods
                    MBillingPaymentSection(),
                    SizedBox(height: MSizes.spaceBtwItems),

                    /// Address
                    MBillingAddressSection(),
                    SizedBox(height: MSizes.spaceBtwItems),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(MSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () async {
              // -- Show Circular Progress Indicator
              Get.offAll(() => Scaffold(
                    body: Center(
                        child: CircularProgressIndicator(
                            strokeCap: StrokeCap.round, color: primaryColor)),
                  ));
              await Future.delayed(const Duration(seconds: 2));

              // -- Go to Success Screen
              Get.offAll(() => SuccessScreen(
                    image: MImages.paymentSuccessIcon,
                    title: 'Payment Succes!',
                    subtitle: 'Your item will be shipped soon!',
                    onPressed: () => Get.offAll(() => const AuthGate()),
                  ));
            },
            child: Obx(() => Text(
                'Checkout ₹${ProductController.instance.cartTotal.value}'))),
      ),
    );
  }
}

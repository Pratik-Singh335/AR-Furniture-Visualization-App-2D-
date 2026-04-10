import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/features/authentication/controllers/sign_up_controller.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';

class MTermsAndConditionsCheckBox extends StatelessWidget {
  const MTermsAndConditionsCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        /// CheckBox
        SizedBox(
          height: MSizes.defaultSpace,
          width: MSizes.defaultSpace,
          child: Obx(
            () {
              return Checkbox(
                value: SignUpController.instance.termsPolicy.value,
                onChanged: (_) {
                  SignUpController.instance.togglePolicy();
                },
              );
            },
          ),
        ),

        const SizedBox(width: MSizes.spaceBtwItems),

        /// Terms & Conditions
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '${'I Agree to'} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: '${'Privacy Policy'} ',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                      decoration: TextDecoration.underline,
                      color: dark ? light : black)),
              TextSpan(
                  text: '${'&'} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: 'Terms of Use',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                      decoration: TextDecoration.underline,
                      color: dark ? light : black)),
            ],
          ),
        )
      ],
    );
  }
}

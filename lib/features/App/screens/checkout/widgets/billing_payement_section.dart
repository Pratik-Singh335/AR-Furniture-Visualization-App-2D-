import 'package:flutter/material.dart';
import 'package:myapp/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:myapp/common/widgets/text/section_heading.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/image_strings.dart';
import 'package:myapp/utils/constants/sizes.dart';

class MBillingPaymentSection extends StatelessWidget {
  const MBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MSectionHeading(
          onPress: () {},
          buttonText: 'Change',
          padding: EdgeInsets.zero,
          heading: 'Payement Method',
          showActionButton: true,
        ),
        const SizedBox(height: MSizes.spaceBtwItems / 2),

        // -- Payment Methods
        const MPaymentIconText(
          icon: MImages.paypal,
          text: 'Paypal',
        ),
        const MPaymentIconText(
          icon: MImages.masterCard,
          text: 'Master Card',
        ),
        const MPaymentIconText(
          icon: MImages.googlePay,
          text: 'Google Pay',
        ),
      ],
    );
  }
}

class MPaymentIconText extends StatelessWidget {
  final String icon, text;

  const MPaymentIconText({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MRoundedContainer(
          padding: const EdgeInsets.all(MSizes.sm),
          height: 40,
          width: 40,
          bgColor: white,
          child: Image.asset(fit: BoxFit.contain, icon),
        ),
        const SizedBox(width: MSizes.spaceBtwItems / 2),
        Text(text, style: Theme.of(context).textTheme.bodyLarge)
      ],
    );
  }
}

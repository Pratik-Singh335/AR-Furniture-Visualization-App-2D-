import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/common/widgets/text/section_heading.dart';
import 'package:myapp/features/authentication/controllers/user_controller.dart';
import 'package:myapp/utils/constants/sizes.dart';

class MBillingAddressSection extends StatelessWidget {
  const MBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MSectionHeading(
          onPress: () {},
          buttonText: 'Change',
          padding: EdgeInsets.zero,
          heading: 'Shipping Address',
          showActionButton: true,
        ),
        Text(UserController.instance.user.value.username,
            style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: MSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: MSizes.iconSm),
            const SizedBox(width: MSizes.spaceBtwItems / 2),
            Obx(() {
              return Text('+ ${UserController.instance.user.value.phoneNumber}',
                  style: Theme.of(context).textTheme.bodyMedium);
            })
          ],
        ),
        const SizedBox(height: MSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history,
                color: Colors.grey, size: MSizes.iconSm),
            const SizedBox(width: MSizes.spaceBtwItems / 2),
            Text('India, South Liana, Mizoram 796001',
                softWrap: true, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: MSizes.spaceBtwItems / 2)
      ],
    );
  }
}

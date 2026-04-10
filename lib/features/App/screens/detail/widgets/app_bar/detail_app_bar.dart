import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/common/widgets/appBar/app_bar.dart';
import 'package:myapp/common/widgets/icons/back_icon_container.dart';
import 'package:myapp/common/widgets/icons/icon_with_badge.dart';
import 'package:myapp/features/App/controllers/product_controller.dart';
import 'package:myapp/features/App/screens/cart/cart_screen.dart';
import 'package:myapp/features/authentication/controllers/user_controller.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';

class MdetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MdetailAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MAppBar(
      bgColor: bgColor,
      padding: EdgeInsets.zero,

      // -- Back Icon
      title: MBackIconContainer(bgColor: primaryColor),

      // -- Cart Icon
      actions: [
        Obx(() {
          final content = ProductController.instance.cartItems.length;
          final isCustomer =
              UserController.instance.user.value.accountType == 'customer';

          if (isCustomer) {
            return MIconWithBadge(
              onPress: () => Get.to(() => const CartScreen()),
              icon: Iconsax.shopping_bag,
              badgeText: content.toString(),
              badgeContentIsText: true,
              iconColor: primaryColor,
              iconSize: MSizes.iconMd * 1.2,
            );
          }

          return const SizedBox.shrink();
        }),
        const SizedBox(width: MSizes.spaceBtwItems)
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MHelperFunctions.getAppBarHeight());
}

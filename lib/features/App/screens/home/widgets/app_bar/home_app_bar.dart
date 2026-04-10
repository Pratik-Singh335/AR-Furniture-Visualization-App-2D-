import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/common/widgets/appBar/app_bar.dart';
import 'package:myapp/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:myapp/common/widgets/icons/back_icon_container.dart';
import 'package:myapp/features/authentication/controllers/user_controller.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/fonts.dart';
import 'package:myapp/utils/constants/image_strings.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';

class MHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;

    return MAppBar(
      // -- Menu Icon
      leadingIcon: FadeInDown(
        child: MBackIconContainer(
          onPress: () => Scaffold.of(context).openDrawer(),
          bgColor: primaryColor,
          padding: EdgeInsets.zero,
          iconSize: MSizes.iconSm,
          icon: Iconsax.menu5,
          margin: const EdgeInsets.all(MSizes.sm * 1.2),
        ),
      ),

      // -- Title
      title: FadeInDown(
        child: Obx(() => Text(
              'Hi, ${userController.user.value.username.split(' ').toList()[0]}',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(fontFamily: MFonts.outfitMedium, color: darkGrey),
            )),
      ),
      centreTitle: true,

      // -- Profile Image
      actions: [
        FadeInDown(
          child: MRoundedContainer(
            height: 50,
            width: 50,
            child: Image.asset(MImages.profile),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MHelperFunctions.getAppBarHeight());
}

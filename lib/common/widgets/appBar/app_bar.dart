import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';

class MAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? bgColor;
  final IconData? backArrowIcon;
  final bool centreTitle;
  final EdgeInsetsGeometry padding;
  final Widget? title;
  final bool showBackArrow;
  final Widget? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  const MAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: MSizes.md),
    this.centreTitle = false,
    this.backArrowIcon,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = MHelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding,
      child: AppBar(
        backgroundColor: bgColor,
        centerTitle: centreTitle,
        automaticallyImplyLeading: false,
        leading: leadingIcon ??
            (showBackArrow
                ? IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      backArrowIcon ?? (Iconsax.arrow_left),
                      color: isDarkMode ? white : dark,
                    ))
                : null),
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MHelperFunctions.getAppBarHeight());
}

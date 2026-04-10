import 'package:badges/badges.dart' as badges;
import 'package:myapp/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:myapp/utils/constants/fonts.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';

class MIconWithBadge extends StatelessWidget {
  final double iconSize;
  final bool badgeContentIsText;
  final EdgeInsetsGeometry? badgePadding;
  final String? badgeText;
  final IconData icon;
  final Color? badgeColor, iconColor;
  final Widget? badgecontent;
  final VoidCallback? onPress;

  const MIconWithBadge({
    super.key,
    this.badgeColor = red,
    this.badgecontent,
    this.onPress,
    this.badgeContentIsText = true,
    this.badgePadding = const EdgeInsets.all(MSizes.xs * 1.2),
    this.iconSize = MSizes.iconMd * 0.88,
    required this.icon,
    required this.badgeText,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = MHelperFunctions.isDarkMode(context);
    return badges.Badge(
      badgeStyle:
          badges.BadgeStyle(badgeColor: badgeColor!, padding: badgePadding!),
      position: badges.BadgePosition.topEnd(end: 2, top: 2),
      badgeContent: badgeContentIsText
          ? Text(
              badgeText ?? '0',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .apply(color: white, fontFamily: MFonts.outfitMedium),
            )
          : badgecontent,
      child: IconButton(
        onPressed: onPress,
        icon: Icon(
          icon,
          size: iconSize,
          color: iconColor ?? (isDarkMode ? white : black),
        ),
      ),
    );
  }
}

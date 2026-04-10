import 'package:flutter/material.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';

class MCircularIcon extends StatelessWidget {
  final double? width, height, size;
  final IconData icon;
  final Color? iconColor;
  final Color? bgColor;
  final VoidCallback? onPress;

  const MCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = MSizes.lg,
    required this.icon,
    this.iconColor,
    this.bgColor,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = MHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onPress,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: bgColor != null
                ? bgColor!
                : isDarkMode
                    ? black.withOpacity(0.9)
                    : white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(child: Icon(icon, color: iconColor, size: size))),
    );
  }
}

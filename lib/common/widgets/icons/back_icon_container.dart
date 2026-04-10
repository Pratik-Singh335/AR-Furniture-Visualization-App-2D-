import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/sizes.dart';

class MBackIconContainer extends StatelessWidget {
  final VoidCallback? onPress;
  final EdgeInsetsGeometry? padding, margin;
  final double height, width, radius, iconSize;
  final IconData? icon;
  final Color bgColor, iconColor;

  const MBackIconContainer({
    super.key,
    this.height = 36,
    this.width = 36,
    this.radius = MSizes.cardRadiusSm,
    this.icon,
    this.bgColor = black,
    this.iconColor = white,
    this.iconSize = MSizes.iconSm,
    this.padding = const EdgeInsets.only(left: MSizes.sm),
    this.margin,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress ?? (() => Get.back()),
      child: MRoundedContainer(
        margin: margin,
        padding: padding,
        radius: radius,
        height: height,
        width: width,
        bgColor: bgColor,
        child: Icon(
          icon ?? (Icons.arrow_back_ios),
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/sizes.dart';

class MRoundedContainer extends StatelessWidget {
  final double radius;
  final bool showBorder;
  final Color borderColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color bgColor;
  final double? width;
  final double? height;
  final Widget? child;
  const MRoundedContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.radius = MSizes.cardRadiusLg,
    this.padding,
    this.bgColor = transparent,
    this.showBorder = false,
    this.borderColor = borderPrimary,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        border: showBorder ? Border.all(color: borderColor) : null,
        color: bgColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}

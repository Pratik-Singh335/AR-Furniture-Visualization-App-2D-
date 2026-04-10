import 'package:flutter/material.dart';
import 'package:myapp/utils/constants/sizes.dart';

class MSpacingStyles {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: MSizes.appBarHeight,
    left: MSizes.defaultSpace,
    right: MSizes.defaultSpace,
    bottom: MSizes.defaultSpace,
  );
}

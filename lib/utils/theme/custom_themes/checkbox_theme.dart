// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:myapp/utils/constants/colors.dart';

class MCheckboxTheme {
  MCheckboxTheme._();

  /*-------------------- Light CheckBox Theme --------------------*/
  static CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.white;
      } else {
        return Colors.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return primaryColor;
      } else {
        return Colors.transparent;
      }
    }),
  );

  /*-------------------- Dark  CheckBox Theme --------------------*/
  static CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.white;
      } else {
        return Colors.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return primaryColor;
      } else {
        return Colors.transparent;
      }
    }),
  );
}

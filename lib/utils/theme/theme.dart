import 'package:flutter/material.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/theme/custom_themes/appbar_theme.dart';
import 'package:myapp/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:myapp/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:myapp/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:myapp/utils/theme/custom_themes/text_form_field_theme.dart';
import 'package:myapp/utils/theme/custom_themes/text_theme.dart';

class MAppTheme {
  MAppTheme._();

  /*-------------------- Light Theme --------------------*/
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: primaryColor,
    brightness: Brightness.light,
    fontFamily: 'FiraSans Regular',
    scaffoldBackgroundColor: bgColor,
    textTheme: MTextTheme.lightTextTheme,
    appBarTheme: MAppbarTheme.lightAppBarTheme,
    checkboxTheme: MCheckboxTheme.lightCheckBoxTheme,
    elevatedButtonTheme: MElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: MOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: MTextFormFieldTheme.lightInputDecorationTheme,
  );

  /*-------------------- Dark Theme --------------------*/
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: primaryColor,
    brightness: Brightness.dark,
    fontFamily: 'FiraSans Regular',
    textTheme: MTextTheme.darkTextTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: MAppbarTheme.darkAppBarTheme,
    checkboxTheme: MCheckboxTheme.darkCheckBoxTheme,
    elevatedButtonTheme: MElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: MOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: MTextFormFieldTheme.darkInputDecorationTheme,
  );
}

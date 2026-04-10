import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/sizes.dart';

class MHelperFunctions {
  // Check if the theme is dark mode
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // Get the screen size
  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static void showSnackBar({
    required IconData icon,
    required String text,
    Color iconColor = yellow,
  }) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 800),
        backgroundColor: white,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: MSizes.iconMd * 1.1,
            ),
            const SizedBox(width: MSizes.sm),
            Text(
              text,
              style: Theme.of(Get.context!)
                  .textTheme
                  .titleSmall!
                  .apply(color: black, fontWeightDelta: 2),
            )
          ],
        ),
      ),
    );
  }
}

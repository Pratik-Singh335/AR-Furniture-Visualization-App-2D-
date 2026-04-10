import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/fonts.dart';
import 'package:myapp/utils/constants/sizes.dart';

class MCategoryWidget extends StatelessWidget {
  const MCategoryWidget({
    super.key,
    required this.text,
    required this.index,
    required this.isSelected,
    this.onPress,
  });
  final String text;
  final int index;
  final bool isSelected;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.only(right: MSizes.spaceBtwSections),
        child: FadeInRight(
          delay: Duration(milliseconds: 1200 + (index * 200)),
          child: Text(toBeginningOfSentenceCase(text),
              style: Theme.of(context).textTheme.headlineSmall!.apply(
                  fontFamily:
                      isSelected ? MFonts.outfitBold : MFonts.outfitMedium,
                  color: isSelected ? primaryColor : darkGrey)),
        ),
      ),
    );
  }
}

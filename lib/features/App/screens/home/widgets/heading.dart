import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/fonts.dart';
import 'package:myapp/utils/constants/sizes.dart';

class MHeading extends StatelessWidget {
  final String firstText, secondText;
  const MHeading({
    super.key,
    required this.firstText,
    required this.secondText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -- Heading
          FadeInLeft(
            delay: const Duration(milliseconds: 500),
            child: Text(
              firstText,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .apply(fontFamily: MFonts.outfitRegular, color: black),
            ),
          ),

          // -- Subheading
          FadeInLeft(
            delay: const Duration(milliseconds: 500),
            child: Text(
              secondText,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .apply(fontFamily: MFonts.outfitMedium, color: primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}

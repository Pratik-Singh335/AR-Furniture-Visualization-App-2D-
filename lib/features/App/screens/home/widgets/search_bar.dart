import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/fonts.dart';
import 'package:myapp/utils/constants/sizes.dart';

class MSearchBar extends StatelessWidget {
  const MSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MSizes.defaultSpace),
      child: ZoomIn(
        curve: Curves.easeInOutCubicEmphasized,
        delay: const Duration(milliseconds: 1000),
        child: TextFormField(
          onTapOutside: (_) => FocusManager.instance.primaryFocus!.unfocus(),
          style: const TextStyle(color: black),
          cursorColor: primaryColor,
          decoration: InputDecoration(
            fillColor: white,
            filled: true,
            hintText: 'Search',
            hintStyle: Theme.of(context)
                .textTheme
                .titleSmall!
                .apply(fontFamily: MFonts.outfitMedium, color: black),
            prefixIcon: Icon(Iconsax.search_normal, color: primaryColor),
            suffixIcon: Icon(Iconsax.setting_3,
                size: MSizes.iconMd * 1.2, color: primaryColor),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(MSizes.borderRadiusLg),
              borderSide: const BorderSide(color: transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(MSizes.borderRadiusLg),
              borderSide: const BorderSide(color: transparent),
            ),
          ),

          // -- Filter List on Every Input
          onChanged: (value) {},
        ),
      ),
    );
  }
}

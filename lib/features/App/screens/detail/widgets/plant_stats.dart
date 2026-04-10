import 'package:flutter/material.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/fonts.dart';
import 'package:myapp/utils/constants/sizes.dart';

class MPlantStats extends StatelessWidget {
  const MPlantStats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // -- Stats Info
    Map<String, Map<String, dynamic>> plantStats = {
      'Dimensions': {
        'icon': Icons.height,
        'text': '120cm x 60cm',
      },
      'Material': {
        'icon': Icons.chair,
        'text': 'Solid Wood',
      },
      'Assembly': {
        'icon': Icons.check_circle_outline,
        'text': 'Required',
      },
    };

    // -- Body
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MSizes.defaultSpace),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: plantStats.entries.map((data) {
          final title = data.key;
          final icon = data.value['icon'];
          final text = data.value['text'];

          return Column(
            children: [
              // -- Icon
              Icon(icon, color: white, size: MSizes.iconMd),
              const SizedBox(height: MSizes.sm),

              // -- title
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(fontFamily: MFonts.outfitMedium, color: white),
              ),
              const SizedBox(height: MSizes.xs),

              // -- Subtitle
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .apply(fontFamily: MFonts.outfitRegular, color: white),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

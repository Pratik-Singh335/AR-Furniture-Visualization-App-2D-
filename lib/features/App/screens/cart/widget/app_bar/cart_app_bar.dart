import 'package:flutter/material.dart';
import 'package:myapp/common/widgets/appBar/app_bar.dart';
import 'package:myapp/common/widgets/icons/back_icon_container.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/fonts.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';

class MCartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MCartAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MAppBar(
      leadingIcon: MBackIconContainer(
          bgColor: primaryColor, margin: const EdgeInsets.all(MSizes.sm * 1.2)),
      centreTitle: true,
      showBackArrow: true,
      title: Text('Cart',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(fontFamily: MFonts.outfitBold, color: black)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MHelperFunctions.getAppBarHeight());
}

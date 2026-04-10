import 'package:flutter/material.dart';
import 'package:myapp/utils/constants/sizes.dart';

class MGridLayout extends StatelessWidget {
  const MGridLayout({
    super.key,
    required this.itemCount,
    this.shrinkWrap = false,
    this.mainAxisExtent = 288,
    required this.itemBuilder,
    this.physics = const AlwaysScrollableScrollPhysics(),
  });

  final ScrollPhysics physics;
  final bool shrinkWrap;
  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: physics,
      shrinkWrap: shrinkWrap,
      padding: const EdgeInsets.symmetric(horizontal: MSizes.spaceBtwItems),
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: mainAxisExtent,
        // -- Veritcal Space (In Between)
        mainAxisSpacing: MSizes.gridViewSpacing * 0.65,

        // -- horizontal Space (In Between)
        crossAxisSpacing: MSizes.gridViewSpacing * 0.65,
        crossAxisCount: 2,
      ),
      itemBuilder: itemBuilder,
    );
  }
}

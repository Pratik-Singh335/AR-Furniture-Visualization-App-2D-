import 'package:flutter/material.dart';
import 'package:myapp/features/App/controllers/product_controller.dart';
import 'package:myapp/features/App/screens/home/widgets/category/category_widget.dart';
import 'package:myapp/utils/constants/sizes.dart';

class MCategory extends StatefulWidget {
  const MCategory({
    super.key,
  });

  @override
  State<MCategory> createState() => _MCategoryState();
}

class _MCategoryState extends State<MCategory> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> menuInfo = [
      'sofa',
      'table',
      'chair',
      'other',
    ];

    return Padding(
      padding: const EdgeInsets.only(
          left: MSizes.defaultSpace, bottom: MSizes.spaceBtwSections),
      child: Row(
        children: List.generate(
          menuInfo.length,
          (index) {
            final text = menuInfo[index];
            return MCategoryWidget(
              text: text,
              index: index,
              isSelected: selectedIndex == index,
              onPress: () => setState(() {
                selectedIndex = index;
                ProductController.instance.selectedCategory.value = text;
              }),
            );
          },
        ),
      ),
    );
  }
}

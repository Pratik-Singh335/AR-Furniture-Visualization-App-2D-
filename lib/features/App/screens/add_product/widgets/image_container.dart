import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/features/App/controllers/add_product_controller.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:myapp/utils/constants/colors.dart';

class MImageContainer extends StatelessWidget {
  const MImageContainer({
    super.key,
    required this.onPress,
  });

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: 150,
      child: DottedBorder(
          padding: const EdgeInsets.all(MSizes.xs),
          color: primaryColor,
          strokeWidth: 1.3,
          borderType: BorderType.RRect,
          dashPattern: const [3, 3],
          radius: const Radius.circular(MSizes.cardRadiusSm),
          child: Center(
            child: Obx(() {
              final hasImage =
                  AddProductController.instance.pickedImages.isNotEmpty;

              return CircleAvatar(
                backgroundColor: hasImage ? green : primaryColor,
                child: IconButton(
                  onPressed: onPress,
                  icon: Icon(
                    hasImage ? Icons.check : Icons.add,
                    color: white,
                    size: MSizes.iconMd * .80,
                  ),
                ),
              );
            }),
          )),
    );
  }
}

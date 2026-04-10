import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:myapp/features/App/controllers/product_controller.dart';
import 'package:myapp/features/App/models/product_model.dart';
import 'package:myapp/features/App/screens/detail/detail_screen.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/fonts.dart';
import 'package:myapp/utils/constants/sizes.dart';

class MProductCardWidget extends StatelessWidget {
  const MProductCardWidget({
    super.key,
    required this.product,
    required this.index,
  });

  final ProductModel product;
  final int index;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;

    return GestureDetector(
      onTap: () {
        Get.to(
          () => DetailScreen(
            product: product,
            tag: index.toString(),
          ),
          duration: const Duration(milliseconds: 400),
        );
      },
      child: ZoomIn(
        delay: Duration(milliseconds: 1000 + (index * 100)),
        child: MRoundedContainer(
          padding: const EdgeInsets.all(MSizes.sm),
          bgColor: white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -- Product Image
              Image.network(product.image[0],
                  height: 180, width: 180, fit: BoxFit.contain),
              const SizedBox(height: MSizes.spaceBtwItems),

              // -- Product Name
              Text(
                product.name,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(fontFamily: MFonts.outfitMedium, color: black),
              ),
              const Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // -- Product Price
                  Text(
                    "₹${product.price}",
                    style: Theme.of(context).textTheme.headlineSmall!.apply(
                          fontFamily: MFonts.teachersBold,
                          color: primaryColor,
                          fontSizeFactor: 1.1,
                        ),
                  ),

                  // -- Like Button
                  Obx(() {
                    final favList = controller.favouriteItems;
                    return GestureDetector(
                      onTap: () => controller.makeFavourite(product.name),
                      child: MRoundedContainer(
                        radius: 20,
                        padding: const EdgeInsets.all(MSizes.sm),
                        bgColor: black,
                        child: Icon(
                          Icons.favorite,
                          size: MSizes.iconSm * 1.2,
                          color: favList.contains(product.name) ? red : white,
                        ),
                      ),
                    );
                  })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

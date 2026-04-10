import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/data/services/supabase_services.dart';
import 'package:myapp/features/App/models/product_model.dart';
import 'package:myapp/features/App/screens/detail/widgets/app_bar/detail_app_bar.dart';
import 'package:myapp/features/App/screens/detail/widgets/virtual_view_button.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/fonts.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailScreen extends StatelessWidget {
  final String tag;
  final ProductModel product;
  const DetailScreen({super.key, required this.product, required this.tag});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    final size = MHelperFunctions.screenSize(context);
    final sellerName = SupabaseServices.instance.usersTable
        .select()
        .eq('id', product.sellerID)
        .single();

    return Scaffold(
      backgroundColor: bgColor,

      // -- AppBar
      appBar: const MdetailAppBar(),

      // -- Body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: MSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -- Product Image

              SizedBox(
                height: size.height * .35,
                child: PageView.builder(
                  controller: controller,
                  itemCount: product.image.length,
                  itemBuilder: (_, index) {
                    return Image.network(
                      fit: BoxFit.contain,
                      product.image[index],
                    );
                  },
                ),
              ),
              const SizedBox(height: MSizes.spaceBtwSections),

              Center(
                child: SmoothPageIndicator(
                    effect: WormEffect(
                      activeDotColor: primaryColor,
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                    controller: controller,
                    count: product.image.length),
              ),
              const SizedBox(height: MSizes.spaceBtwSections),

              // -- Product Name
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .apply(fontFamily: MFonts.outfitRegular, color: black),
                  ),
                  Text(
                    "₹${product.price}",
                    style: Theme.of(context).textTheme.headlineLarge!.apply(
                          fontFamily: MFonts.notosRegular,
                          color: primaryColor,
                          fontWeightDelta: -5,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: MSizes.spaceBtwSections),

              Row(
                children: [
                  Text('Seller   :   ',
                      style: Theme.of(context).textTheme.headlineSmall),
                  FutureBuilder(
                    future: sellerName,
                    builder: (context, snapshot) {
                      return Text(snapshot.data?['username'] ?? 'Loading...',
                          style: Theme.of(context).textTheme.titleSmall!.apply(
                              fontFamily: MFonts.outfitRegular,
                              color: darkGrey));
                    },
                  )
                ],
              ),
              const SizedBox(height: MSizes.sm),

              Row(
                children: [
                  Text('Category   :   ',
                      style: Theme.of(context).textTheme.headlineSmall),
                  Text(toBeginningOfSentenceCase(product.category),
                      style: Theme.of(context).textTheme.titleSmall!.apply(
                          fontFamily: MFonts.outfitRegular, color: darkGrey))
                ],
              ),
              const SizedBox(height: MSizes.sm),

              // -- Product Description
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Description   :   ',
                        style: Theme.of(context).textTheme.headlineSmall),
                    TextSpan(
                        text: product.description,
                        style: Theme.of(context).textTheme.titleSmall!.apply(
                            fontFamily: MFonts.outfitRegular, color: darkGrey)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
            vertical: MSizes.spaceBtwItems, horizontal: MSizes.defaultSpace),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(MSizes.cardRadiusLg * 1.3),
              topRight: Radius.circular(MSizes.cardRadiusLg * 1.3)),
        ),
        child: MVirtualViewButton(product: product),
      ),
    );
  }
}

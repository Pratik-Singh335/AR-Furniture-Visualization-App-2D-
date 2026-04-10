import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/data/services/supabase_services.dart';
import 'package:myapp/features/App/controllers/product_controller.dart';
import 'package:myapp/features/App/screens/add_product/add_product_screen.dart';
import 'package:myapp/features/App/screens/home/widgets/app_bar/home_app_bar.dart';
import 'package:myapp/features/App/screens/home/widgets/category/category.dart';
import 'package:myapp/features/App/screens/home/widgets/heading.dart';
import 'package:myapp/features/App/screens/home/widgets/home_drawer.dart';
import 'package:myapp/features/App/screens/home/widgets/products/products.dart';
import 'package:myapp/features/App/screens/home/widgets/search_bar.dart';
import 'package:myapp/features/authentication/controllers/user_controller.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      // -- App Bar
      appBar: const MHomeAppBar(),

      // -- Drawer
      drawer: const HomeDrawer(),

      // -- Body
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: MSizes.spaceBtwSections),

            Obx(() {
              if (UserController.instance.user.value.accountType == 'seller') {
                return const MHeading(
                    firstText: 'Boost Your', secondText: 'Sales Today');
              }
              return const MHeading(
                  firstText: 'Find Your', secondText: 'Perfect Style');
            }),

            const SizedBox(height: MSizes.spaceBtwSections),

            // - Search Bar
            const MSearchBar(),
            const SizedBox(height: MSizes.spaceBtwSections),

            // -- Category
            Obx(() {
              if (UserController.instance.user.value.accountType ==
                  'customer') {
                return const MCategory();
              }

              return const SizedBox.shrink();
            }),

            // -- Products
            Obx(() {
              final category =
                  ProductController.instance.selectedCategory.value;
              if (UserController.instance.user.value.accountType == 'seller') {
                return MProducts(
                  stream: SupabaseServices.instance.sellerProductStream(
                      UserController.instance.user.value.id!),
                );
              }
              return MProducts(
                stream:
                    SupabaseServices.instance.categoryProductStream(category),
              );
            }),
            const SizedBox(height: MSizes.spaceBtwSections),
          ],
        ),
      ),

      // -- Add Product Button (For Sellers)
      floatingActionButton: Obx(
        () => UserController.instance.user.value.accountType == 'customer'
            ? const SizedBox.shrink()
            : FloatingActionButton(
                backgroundColor: primaryColor,
                onPressed: () => Get.to(
                  duration: const Duration(milliseconds: 350),
                  transition: Transition.rightToLeft,
                  () => const AddProductScreen(),
                ),
                child: const Icon(Icons.add, color: white),
              ),
      ),
    );
  }
}

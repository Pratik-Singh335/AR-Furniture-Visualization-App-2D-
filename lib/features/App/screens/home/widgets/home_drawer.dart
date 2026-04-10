import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/data/services/auth_services.dart';
import 'package:myapp/features/authentication/controllers/user_controller.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/sizes.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;
    final auth = AuthServices.instance;

    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: MSizes.spaceBtwItems),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: MSizes.spaceBtwSections * 2),

            // -- Full Name
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Text(userController.user.value.username,
                    style: Theme.of(context).textTheme.headlineMedium)),
                Text('(${userController.user.value.accountType.capitalize})',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .apply(color: darkGrey))
              ],
            ),
            const SizedBox(height: MSizes.xs),

            // -- Email
            Obx(() => Text(userController.user.value.email,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(color: darkGrey))),

            const Divider(height: MSizes.spaceBtwSections),

            // -- Home (Goes to Home Screen)
            ListTile(
              onTap: () => Scaffold.of(context).closeDrawer(),
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.home, color: black),
              title: Text(
                'H O M E',
                style:
                    Theme.of(context).textTheme.titleSmall!.apply(color: black),
              ),
            ),

            // -- Logout (Logs Out User)
            ListTile(
              onTap: () async => await auth.signOUT(),
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.logout, color: black),
              title: Text(
                'L O G O U T',
                style:
                    Theme.of(context).textTheme.titleSmall!.apply(color: black),
              ),
            )
          ],
        ),
      ),
    );
  }
}

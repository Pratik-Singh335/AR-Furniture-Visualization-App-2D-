import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/features/authentication/controllers/login_controller.dart';
import 'package:myapp/features/authentication/screens/sign_up/sign_up.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/validators/validation.dart';

class MLoginForm extends StatelessWidget {
  const MLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;

    return Form(
      key: controller.loginKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: MSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              controller: controller.emailController,
              validator: (value) => MValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: MSizes.spaceBtwInputFields),

            /// Password
            Obx(
              () => TextFormField(
                obscureText: controller.hidePassword.value,
                controller: controller.passwordController,
                validator: (value) =>
                    MValidator.validateEmptyText('Password', value),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                    ),
                    onPressed: () => controller.togglePassword(),
                  ),
                ),
              ),
            ),

            const SizedBox(height: MSizes.spaceBtwSections),

            /// Sign in Button
            SizedBox(
              width: double.infinity,
              child: Obx(() => ElevatedButton(
                  onPressed: () => controller.login(),
                  child: controller.isLoading.value
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: white,
                            strokeCap: StrokeCap.round,
                            strokeWidth: 2.5,
                          ),
                        )
                      : const Text('Login'))),
            ),

            const SizedBox(height: MSizes.spaceBtwItems),

            /// Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignUpScreen()),
                child: const Text('Create Account'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

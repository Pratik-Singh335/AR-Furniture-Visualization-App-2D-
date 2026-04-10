import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:myapp/features/authentication/controllers/sign_up_controller.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/validators/validation.dart';
import 'package:myapp/features/authentication/screens/sign_up/widgets/terms_conditions_checkbox.dart';

class MSignUpForm extends StatelessWidget {
  const MSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;

    return Form(
      key: controller.signupKey,
      child: Column(
        children: [
          /// Username
          TextFormField(
            controller: controller.usernameController,
            validator: (value) =>
                MValidator.validateEmptyText('Username', value),
            decoration: const InputDecoration(
              labelText: 'Username',
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),

          const SizedBox(height: MSizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            controller: controller.emailController,
            validator: (value) => MValidator.validateEmail(value),
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),

          const SizedBox(height: MSizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            controller: controller.phoneController,
            validator: (value) => MValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
              labelText: 'Phone',
              prefixIcon: Icon(Iconsax.call),
            ),
          ),

          const SizedBox(height: MSizes.spaceBtwInputFields),

          /// Password
          Obx(() => TextFormField(
                obscureText: controller.hidePassword.value,
                controller: controller.passwordController,
                validator: (value) => MValidator.validatePassword(value),
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                    ),
                    onPressed: () => controller.togglePassword(),
                  ),
                ),
              )),
          const SizedBox(height: MSizes.spaceBtwInputFields),

          // -- Account Type
          DropdownButtonFormField(
              hint: const Text('Account'),
              items: ['customer', 'seller']
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(item.capitalize!),
                      ))
                  .toList(),
              onChanged: (value) {
                controller.accountType.value = value!;
              }),

          const SizedBox(height: MSizes.spaceBtwSections),

          /// Terms & Conditions - CheckBox
          const MTermsAndConditionsCheckBox(),
          const SizedBox(height: MSizes.spaceBtwSections),

          /// Sign Up Button
          Obx(
            () => SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.createAccount(),
                child: controller.loading.value
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: white,
                          strokeCap: StrokeCap.round,
                          strokeWidth: 2.5,
                        ),
                      )
                    : const Text('Create Account'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

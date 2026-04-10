import 'package:flutter/material.dart';
import 'package:myapp/features/authentication/screens/sign_up/widgets/sign_up_form.dart';
import 'package:myapp/utils/constants/sizes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text('Sign Up',
                  style: Theme.of(context).textTheme.headlineMedium),

              const SizedBox(height: MSizes.spaceBtwSections),

              /// Form
              const MSignUpForm(),
              const SizedBox(height: MSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:myapp/features/authentication/screens/login/widgets/login_form.dart';
import 'package:myapp/features/authentication/screens/login/widgets/login_header.dart';
import 'package:myapp/utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(MSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Logo, Title, Subtitle
            MLoginHeader(),

            /// Form
            MLoginForm(),
          ],
        ),
      ),
    );
  }
}

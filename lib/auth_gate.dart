import 'package:flutter/material.dart';
import 'package:myapp/features/authentication/controllers/user_controller.dart';
import 'package:myapp/features/authentication/screens/login/login.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:myapp/features/App/screens/home/home_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = UserController.instance;

    return StreamBuilder<AuthState>(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                  color: white, strokeCap: StrokeCap.round),
            ),
          );
        }

        final session = snapshot.data?.session;

        if (session == null) {
          return const LoginScreen();
        }

        // -- Fetch User Details
        UserController.instance.fetchUserDetails();

        return const HomeScreen();
      },
    );
  }
}

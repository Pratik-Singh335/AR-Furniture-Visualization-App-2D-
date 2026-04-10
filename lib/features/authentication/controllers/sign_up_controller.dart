import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/data/services/auth_services.dart';
import 'package:myapp/data/services/supabase_services.dart';
import 'package:myapp/features/authentication/models/user_model.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find<SignUpController>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  final auth = AuthServices.instance;
  final supabase = SupabaseServices.instance;
  GlobalKey<FormState> signupKey = GlobalKey<FormState>();

  RxBool loading = false.obs;

  RxString accountType = ''.obs;
  RxBool hidePassword = true.obs;
  RxBool termsPolicy = false.obs;

  void togglePolicy() => termsPolicy.toggle();

  void togglePassword() => hidePassword.toggle();

  // -- CREATE ACCOUNT
  Future<void> createAccount() async {
    if (!signupKey.currentState!.validate()) return;

    if (accountType.isEmpty) {
      return MHelperFunctions.showSnackBar(
        icon: Icons.warning,
        text: 'Select Account Type',
      );
    }

    if (!termsPolicy.value) {
      return MHelperFunctions.showSnackBar(
        icon: Icons.warning,
        text: 'Check the Policy Box',
      );
    }

    loading.value = true;

    try {
      // -- Sign Up User
      final response = await auth.signUP(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (response == null || response.user == null) {
        loading.value = false;
        return;
      }

      // -- Create New User Model
      final newUser = UserModel(
        username: usernameController.text.trim(),
        email: emailController.text.trim(),
        phoneNumber: phoneController.text.trim(),
        accountType: accountType.value,
      );

      // -- Add into DB
      await supabase.create(newUser.toJson(), supabase.usersTable);

      // -- Go Back to Auth Gate Screen
      Get.back();

      // -- Stop Loading
      loading.value = false;

      // -- Clear All Fields
      usernameController.clear();
      emailController.clear();
      phoneController.clear();
      passwordController.clear();
      accountType.value = '';
    } catch (e) {
      loading.value = false;
    }
  }
}

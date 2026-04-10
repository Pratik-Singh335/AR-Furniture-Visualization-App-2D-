import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/data/services/auth_services.dart';
import 'package:myapp/features/authentication/controllers/user_controller.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find<LoginController>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final auth = AuthServices.instance;
  final user = UserController.instance;
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  RxBool rememberMe = false.obs;
  RxBool isLoading = false.obs;
  RxBool hidePassword = true.obs;

  void togglePassword() => hidePassword.toggle();

  // -- LOGIN
  Future<void> login() async {
    if (!loginKey.currentState!.validate()) {
      return;
    }

    try {
      isLoading.value = true;

      // -- SIGN IN
      await auth.signIN(
          emailController.text.trim(), passwordController.text.trim());

      isLoading.value = false;

      emailController.clear();
      passwordController.clear();
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }
}

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthServices extends GetxController {
  static AuthServices get instance => Get.find<AuthServices>();

  final SupabaseClient supabase = Supabase.instance.client;

  // -- SIGN UP
  Future<AuthResponse?> signUP(String email, String password) async {
    try {
      return await supabase.auth.signUp(email: email, password: password);
    } on AuthException catch (e) {
      if (e.message.contains('User already registered')) {
        Get.snackbar('Error', 'This email is already registered. Try Another.');
      } else {
        Get.snackbar('Error', e.message);
      }
      return null;
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong. Please try again.');
      return null;
    }
  }

  // -- SIGN IN
  Future<AuthResponse> signIN(String email, String password) async {
    try {
      return await supabase.auth
          .signInWithPassword(email: email, password: password);
    } catch (e) {
      throw Exception('Error $e');
    }
  }

  // -- SIGN OUT
  Future<void> signOUT() async {
    try {
      await supabase.auth.signOut();
    } catch (e) {
      throw Exception('Error $e');
    }
  }

  // -- FORGOT PASSWORD
  Future<void> forgotPassword(String email) async {
    try {
      await supabase.auth.resetPasswordForEmail(email);
    } catch (e) {
      throw Exception('Error $e');
    }
  }
}

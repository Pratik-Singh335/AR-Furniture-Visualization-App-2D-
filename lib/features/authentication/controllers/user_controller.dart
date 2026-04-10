import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/data/services/supabase_services.dart';
import 'package:myapp/features/authentication/models/user_model.dart';
import 'package:myapp/utils/constants/colors.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find<UserController>();

  Rx<UserModel> user = UserModel.empty().obs;

  final supabase = SupabaseServices.instance;

  // -- Fetch and store current user details
  Future<UserModel> fetchUserDetails() async {
    final session = Supabase.instance.client.auth.currentSession;

    if (session == null) {
      MHelperFunctions.showSnackBar(
          icon: Icons.cancel, text: 'No User Logged In', iconColor: red);
      return UserModel.empty();
    }

    final email = session.user.email;

    final response =
        await supabase.usersTable.select().eq('email', email ?? '').single();

    user(UserModel.fromJson(response));

    return user.value;
  }
}

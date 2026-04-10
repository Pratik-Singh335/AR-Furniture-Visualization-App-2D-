import 'package:get/get.dart';
import 'package:myapp/data/services/auth_services.dart';
import 'package:myapp/data/services/supabase_services.dart';
import 'package:myapp/features/App/controllers/product_controller.dart';
import 'package:myapp/features/App/controllers/add_product_controller.dart';
import 'package:myapp/features/authentication/controllers/login_controller.dart';
import 'package:myapp/features/authentication/controllers/sign_up_controller.dart';
import 'package:myapp/features/authentication/controllers/user_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthServices());
    Get.put(SupabaseServices());
    Get.put(UserController());
    Get.put(LoginController());
    Get.put(SignUpController());
    Get.put(ProductController());
    Get.put(AddProductController());
  }
}

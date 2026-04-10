import 'package:get/get.dart';
import 'package:myapp/features/App/models/product_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find<ProductController>();

  RxInt cartTotal = 0.obs;
  RxInt cartSubtotal = 0.obs;
  RxString selectedCategory = 'sofa'.obs;
  RxList<String> favouriteItems = <String>[].obs;
  RxList<ProductModel> cartItems = <ProductModel>[].obs;

  // -- Add to Favourites
  void makeFavourite(String name) {
    if (favouriteItems.contains(name)) {
      favouriteItems.remove(name);
    } else {
      favouriteItems.add(name);
    }
  }

  // -- Add & Remove Product to Cart
  void addToCart(ProductModel product) {
    if (cartItems.contains(product)) {
      product.quantity = 0.obs;
      cartItems.remove(product);
    } else {
      product.quantity += 1;
      cartItems.add(product);
    }
  }

  // -- Add Product Quantity
  void onAdd(ProductModel product) {
    product.quantity++;
  }

// -- Remove Product Quantity
  void onRemove(ProductModel product) {
    if (product.quantity.value > 0) {
      product.quantity -= 1;
      if (product.quantity.value == 0) {
        cartItems.remove(product);
      }
    }
  }

  void generateBill() {
    int subtotal = 0;

    for (var item in cartItems) {
      subtotal += item.quantity.value * int.parse(item.price);
    }

    cartSubtotal.value = subtotal;
    cartTotal.value = subtotal + 150 + 80;
  }
}

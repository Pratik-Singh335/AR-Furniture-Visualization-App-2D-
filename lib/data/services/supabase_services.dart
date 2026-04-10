import 'package:get/get.dart';
import 'package:myapp/data/services/auth_services.dart';
import 'package:myapp/features/App/models/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices extends GetxController {
  static SupabaseServices get instance => Get.find<SupabaseServices>();

  final supabase = Supabase.instance.client;
  final storage = Supabase.instance.client.storage;

  final auth = AuthServices.instance;

  final productsTable = Supabase.instance.client.from('products');
  final usersTable = Supabase.instance.client.from('users');

  // -- CREATE
  Future<void> create(
      Map<String, dynamic> json, SupabaseQueryBuilder table) async {
    await table.insert(json);
  }

  // -- READ ALL PRODUCTS
  final allProductStream = Supabase.instance.client
      .from('products')
      .stream(primaryKey: ['id']).map(
          (list) => list.map((json) => ProductModel.fromJson(json)).toList());

  // -- READ SELLER'S PRODUCTS
  Stream<List<ProductModel>> sellerProductStream(int sellerId) {
    return productsTable
        .stream(primaryKey: ['id'])
        .eq('sellerId', sellerId)
        .map(
            (list) => list.map((json) => ProductModel.fromJson(json)).toList());
  }

  // -- READ PRODUCT CATEGORY WISE
  Stream<List<ProductModel>> categoryProductStream(String category) {
    return productsTable
        .stream(primaryKey: ['id'])
        .eq('category', category)
        .map(
            (list) => list.map((json) => ProductModel.fromJson(json)).toList());
  }

  // -- UPDATE
  Future<void> updatee(ProductModel product, Map<String, dynamic> json) async {
    await productsTable.update(json).eq('id', product.id!);
  }

  // -- DELETE
  Future<void> delete(ProductModel product) async {
    await productsTable.delete().eq('id', product.id!);
  }
}

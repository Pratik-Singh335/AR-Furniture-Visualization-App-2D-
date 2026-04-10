import 'package:get/get.dart';

class ProductModel {
  final int? id;
  RxInt quantity;
  final int sellerID;
  final String name, price, description, category;
  final List<String> image;

  ProductModel({
    this.id,
    required this.quantity,
    required this.name,
    required this.image,
    required this.price,
    required this.category,
    required this.sellerID,
    required this.description,
  });

  // -- Empty Model
  static ProductModel empty() {
    return ProductModel(
      name: '',
      image: [],
      price: '',
      sellerID: 0,
      category: '',
      description: '',
      quantity: 0.obs,
    );
  }

  // -- Convert Data to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'category': category,
      'sellerId': sellerID,
      'description': description,
    };
  }

  // -- Convert JSON to Model
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      quantity: 0.obs,
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] == null
          ? []
          : (json['image'] as List<dynamic>).map((e) => e.toString()).toList(),
      price: json['price'] ?? '',
      sellerID: json['sellerId'] ?? '',
      category: json['category'] ?? '',
      description: json['description'] ?? '',
    );
  }
}

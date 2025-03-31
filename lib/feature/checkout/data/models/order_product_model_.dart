import 'package:commerce_hub/feature/home/domain/cart_item_entity.dart';

class OrderProductModel {
  final String code;
  final String name;
  final String imageUrl;
  final double price;
  final int quantity;

  OrderProductModel({
    required this.code,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      code: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
    );
  }
  factory OrderProductModel.fromEntity({required CartItemEntity cartItemEntity}) {
    return OrderProductModel(
      code: cartItemEntity.productInputEntity.code,
      name: cartItemEntity.productInputEntity.name,
      imageUrl: cartItemEntity.productInputEntity.imageUrl!,
      price: cartItemEntity.productInputEntity.price.toDouble(),
      quantity: cartItemEntity.quantity,
    );
  }
  toJson() {
    return {
      'code': code,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }
}
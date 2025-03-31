import 'package:commerce_hub/feature/checkout/domain/shipping_address_entity.dart';

class ShippingAddresModel {
  String? name;
  String? address;
  String? city;
  String? email;
  String? phone;
  String? post;
  String? floor;

  ShippingAddresModel(
      {this.name,
      this.address,
      this.city,
      this.email,
      this.phone,
      this.post,
      this.floor});

  factory ShippingAddresModel.fromEntity(
      ShippingAddressEntity shippingAddressEntity) {
    return ShippingAddresModel(
      name: shippingAddressEntity.name,
      address: shippingAddressEntity.address,
      city: shippingAddressEntity.city,
      email: shippingAddressEntity.email,
      phone: shippingAddressEntity.phone,
      post: shippingAddressEntity.post,
      floor: shippingAddressEntity.floor,
    );
  }
  
  
  factory ShippingAddresModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddresModel(
      name: json['name'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      post: json['post'] as String?,
      floor: json['floor'] as String?,
    );
  }
  toJson() {
    return {
      'name': name,
      'address': address,
      'city': city,
      'email': email,
      'phone': phone,
      'post': post,
      'floor': floor,
    };
  }

  @override
  String toString() {
    return '$address $city $floor';
  }
}

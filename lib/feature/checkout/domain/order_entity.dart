import 'package:commerce_hub/feature/checkout/domain/shipping_address_entity.dart';
import 'package:commerce_hub/feature/home/domain/cart_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
   bool? payWithcach;
  final ShippingAddressEntity? shippingAddress;
  OrderEntity( this.cartEntity,
      {  this.shippingAddress, this.payWithcach});
}

import 'package:commerce_hub/feature/checkout/domain/entity/shipping_address_entity.dart';
import 'package:commerce_hub/feature/home/domain/cart_entity.dart';

class OrderEntity {
  CartEntity cartEntity;
  bool? payWithcach;
  final String uId;
  ShippingAddressEntity? shippingAddressEntity = ShippingAddressEntity();
  OrderEntity(this.cartEntity, {this.payWithcach, required this.uId});

  calculateShippingCost() {
    if (payWithcach == true) {
      return 30;
    } else {
      return 0;
    }
  }

  calcualteShippingDiscount() {
    if (cartEntity.calculateTotalPrice() > 100) {
      return 10;
    } else {
      return 0;
    }
  }
  calculateTotalPriceAfterDiscountAndShipping() {
    return cartEntity.calculateTotalPrice() +
        calculateShippingCost() -
        calcualteShippingDiscount();
  }
}

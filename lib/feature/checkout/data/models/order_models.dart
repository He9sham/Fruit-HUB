import 'package:commerce_hub/feature/checkout/data/models/order_product_model_.dart';
import 'package:commerce_hub/feature/checkout/data/models/shipping_model.dart';
import 'package:commerce_hub/feature/checkout/domain/entity/order_entity.dart';

class OrderModels {
  final double totalPrice;
  final String uId;
  final ShippingAddresModel shippingAddressModel;
  final List<OrderProductModel> orderProductModel;
  final String paymentMethod;

  OrderModels(
      {required this.totalPrice,
      required this.uId,
      required this.paymentMethod,
      required this.shippingAddressModel,
      required this.orderProductModel});

  factory OrderModels.fromEntity(OrderEntity orderEntity) {
    return OrderModels(
      paymentMethod: orderEntity.payWithcach == true ? 'Cash' : 'Card',
      totalPrice: orderEntity.cartEntity.calculateTotalPrice() + 30,
      uId: orderEntity.uId,
      shippingAddressModel:
          ShippingAddresModel.fromEntity(orderEntity.shippingAddressEntity!),
      orderProductModel: orderEntity.cartEntity.cartItems
          .map((e) => OrderProductModel.fromEntity(cartItemEntity: e))
          .toList(),
    );
  }

  toJson() {
    return {
      'paymentMethod': paymentMethod,
      'totalPrice': totalPrice,
      'uId': uId,
      'shippingAddressModel': shippingAddressModel.toJson(),
      'orderProductModel': orderProductModel.map((e) => e.toJson()).toList(),
    };
  }
}

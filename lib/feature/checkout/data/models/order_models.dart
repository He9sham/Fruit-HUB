import 'package:commerce_hub/core/enums/orders_status_enum.dart';
import 'package:commerce_hub/feature/checkout/data/models/order_product_model_.dart';
import 'package:commerce_hub/feature/checkout/data/models/shipping_model.dart';
import 'package:commerce_hub/feature/checkout/domain/entity/order_entity.dart';
import 'package:uuid/uuid.dart';

class OrderModels {
  final double totalPrice;
  final String uId;
  final ShippingAddresModel shippingAddressModel;
  final List<OrderProductModel> orderProductModel;
  final String paymentMethod;
  final String orderId;

  OrderModels(
      {required this.totalPrice,
      required this.uId,
      required this.orderId,
      required this.paymentMethod,
      required this.shippingAddressModel,
      required this.orderProductModel});

  factory OrderModels.fromEntity(OrderInputEntity orderEntity) {
    return OrderModels(
      orderId:Uuid().v4(),
      paymentMethod: orderEntity.payWithcach == true ? 'Cash' : 'PayPal',
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
      'orderId': orderId,
      'paymentMethod': paymentMethod,
      'totalPrice': totalPrice,
      'uId': uId,
      'status': OrderStatusEnum.values,
      'date': DateTime.now().toString(),
      'shippingAddressModel': shippingAddressModel.toJson(),
      'orderProductModel': orderProductModel.map((e) => e.toJson()).toList(),
    };
  }
}

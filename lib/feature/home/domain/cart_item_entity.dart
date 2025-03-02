import 'package:commerce_hub/core/entity/product_input_entity.dart';

class CartItemEntity {
  final ProductInputEntity productInputEntity;

  int count;

  CartItemEntity({required this.productInputEntity, this.count = 1});

  num calculateTotalPrice() {
    return productInputEntity.price * count;
  }

  num calculateTotalWeight() {
    return productInputEntity.unitAmount * count;
  }

  increaseCount() {
    count++;
  }

  deccreaseCount() {
    count--;
  }
}

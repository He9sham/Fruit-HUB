import 'package:commerce_hub/core/entity/product_input_entity.dart';
import 'package:equatable/equatable.dart';

class CartItemEntity extends Equatable {
  final ProductInputEntity productInputEntity;

  int quantity;

  CartItemEntity({required this.productInputEntity, this.quantity = 1});

  num calculateTotalPrice() {
    return productInputEntity.price * quantity;
  }

  num calculateTotalWeight() {
    return productInputEntity.unitAmount * quantity;
  }

  increaseCount() {
    quantity++;
  }

  deccreaseCount() {
    quantity--;
  }

  @override
  List<Object?> get props => [productInputEntity];
}

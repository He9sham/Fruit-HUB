import 'package:commerce_hub/core/entity/product_input_entity.dart';
import 'package:equatable/equatable.dart';

class CartItemEntity extends Equatable {
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
  
  @override
  
  List<Object?> get props => [productInputEntity];
}

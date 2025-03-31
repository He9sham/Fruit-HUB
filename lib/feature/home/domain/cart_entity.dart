import 'package:commerce_hub/core/entity/product_input_entity.dart';
import 'package:commerce_hub/feature/home/domain/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  calculateTotalPrice() {
    num totalPrice = 0;
    for (var cartItem in cartItems) {
      totalPrice += cartItem.calculateTotalPrice();
    }
    return totalPrice;
  }

  void removeCartItem(CartItemEntity cartItemEntity) {
    cartItems.remove(cartItemEntity);
  }

  bool isExist(ProductInputEntity productInputEntity) {
    for (var cartItem in cartItems) {
      if (cartItem.productInputEntity == productInputEntity) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem(ProductInputEntity productInputEntity) {
    for (var cartItem in cartItems) {
      if (cartItem.productInputEntity == productInputEntity) {
        return cartItem;
      }
    }
    return CartItemEntity(productInputEntity: productInputEntity, quantity: 1);
  }
}

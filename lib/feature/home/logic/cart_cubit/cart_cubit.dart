import 'package:bloc/bloc.dart';
import 'package:commerce_hub/core/entity/product_input_entity.dart';
import 'package:commerce_hub/feature/home/domain/cart_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity(
    cartItems: [],
  );

  void addProduct(ProductInputEntity productInputEntity) {
    bool isExist = cartEntity.isExist(productInputEntity);
    var cartitem = cartEntity.getCartItem(productInputEntity);
    if (isExist) {
      cartitem.increaseCount();
    } else {
      cartEntity.addCartItem(cartitem);
    }

    emit(CartAdded());
  }
}

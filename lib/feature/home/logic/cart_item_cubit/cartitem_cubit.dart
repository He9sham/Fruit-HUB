import 'package:bloc/bloc.dart';
import 'package:commerce_hub/feature/home/domain/cart_item_entity.dart';

part 'cartitem_state.dart';

class CartitemCubit extends Cubit<CartitemState> {
  CartitemCubit() : super(CartitemInitial());

  void updateCartItem(CartItemEntity cartItemEntity) {
    emit(CartitemUpdate(cartItemEntity));
  }
}

part of 'cartitem_cubit.dart';

sealed class CartitemState {
  const CartitemState();
}

final class CartitemInitial extends CartitemState {}

final class CartitemUpdate extends CartitemState {
  final CartItemEntity cartItemEntity;

  const CartitemUpdate(this.cartItemEntity);
}

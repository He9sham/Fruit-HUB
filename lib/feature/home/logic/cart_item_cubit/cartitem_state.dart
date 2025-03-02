part of 'cartitem_cubit.dart';

sealed class CartitemState extends Equatable {
  const CartitemState();

  @override
  List<Object> get props => [];
}

final class CartitemInitial extends CartitemState {}

final class CartitemUpdate extends CartitemState {
  final CartItemEntity cartItemEntity;

  const CartitemUpdate(this.cartItemEntity);
}

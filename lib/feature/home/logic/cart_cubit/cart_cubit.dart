import 'package:bloc/bloc.dart';
import 'package:commerce_hub/core/entity/product_input_entity.dart';
import 'package:commerce_hub/core/service/analytics_service.dart';
import 'package:commerce_hub/core/service/get_it_service.dart';
import 'package:commerce_hub/feature/home/domain/cart_entity.dart';
import 'package:commerce_hub/feature/home/domain/cart_item_entity.dart';
import 'package:flutter/foundation.dart';

part 'cart_state.dart';

class CartProductCubit extends Cubit<CartState> {
  // Reference to the analytics service
  final AnalyticsService _analyticsService = getIt<AnalyticsService>();

  CartProductCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity(
    cartItems: [],
  );

  void addProduct(ProductInputEntity productInputEntity) {
    // Check if the cubit is closed before proceeding
    if (isClosed) {
      if (kDebugMode) {
        print('Cannot add product to cart: CartProductCubit is closed');
      }
      return;
    }

    bool isExist = cartEntity.isExist(productInputEntity);
    var cartitem = cartEntity.getCartItem(productInputEntity);
    if (isExist) {
      cartitem.increaseCount();
    } else {
      cartEntity.addCartItem(cartitem);
    }

    // Track add to cart event
    _analyticsService.trackAddToCart(productInputEntity);

    if (!isClosed) {
      emit(CartAdded());
    }
  }

  void removeProduct(CartItemEntity cartitem) {
    // Check if the cubit is closed before proceeding
    if (isClosed) {
      if (kDebugMode) {
        print('Cannot remove product from cart: CartProductCubit is closed');
      }
      return;
    }

    cartEntity.removeCartItem(cartitem);

    // Track remove from cart event
    _analyticsService.trackRemoveFromCart(cartitem.productInputEntity);

    if (!isClosed) {
      emit(CartRemoved());
    }
  }
}

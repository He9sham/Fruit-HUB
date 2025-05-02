import 'package:bloc/bloc.dart';
import 'package:commerce_hub/core/entity/product_input_entity.dart';
import 'package:commerce_hub/core/service/analytics_service.dart';
import 'package:commerce_hub/core/service/get_it_service.dart';
import 'package:commerce_hub/feature/profile/logic/favorites_cubit/favorites_state.dart';
import 'package:flutter/foundation.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  // Reference to the analytics service
  final AnalyticsService _analyticsService = getIt<AnalyticsService>();

  FavoritesCubit() : super(FavoritesInitial()) {
    // Initialize with empty favorites list
    emit(const FavoritesLoaded(favorites: []));
  }

  // List to store favorite products
  final List<ProductInputEntity> _favorites = [];

  // Add a product to favorites
  void addToFavorites(ProductInputEntity product) {
    // Check if the cubit is closed before emitting
    if (isClosed) {
      if (kDebugMode) {
        print('Cannot add to favorites: FavoritesCubit is closed');
      }
      return;
    }

    try {
      // Check if product is already in favorites
      if (!_isProductInFavorites(product)) {
        _favorites.add(product);
        // Track the add to favorites event
        _analyticsService.trackAddToFavorites(product);

        if (!isClosed) {
          emit(FavoritesLoaded(favorites: List.from(_favorites)));
        }
      }
    } catch (e) {
      emit(FavoritesError(message: e.toString()));
    }
  }

  // Remove a product from favorites
  void removeFromFavorites(ProductInputEntity product) {
    // Check if the cubit is closed before emitting
    if (isClosed) {
      if (kDebugMode) {
        print('Cannot remove from favorites: FavoritesCubit is closed');
      }
      return;
    }

    try {
      _favorites.removeWhere((p) => p.code == product.code);
      // Track the remove from favorites event
      _analyticsService.trackRemoveFromFavorites(product);

      if (!isClosed) {
        emit(FavoritesLoaded(favorites: List.from(_favorites)));
      }
    } catch (e) {
      emit(FavoritesError(message: e.toString()));
    }
  }

  // Toggle a product's favorite status
  void toggleFavorite(ProductInputEntity product) {
    // Check if the cubit is closed before proceeding
    if (isClosed) {
      if (kDebugMode) {
        print('Cannot toggle favorite: FavoritesCubit is closed');
      }
      return;
    }

    if (_isProductInFavorites(product)) {
      removeFromFavorites(product);
    } else {
      addToFavorites(product);
    }
  }

  // Check if a product is in favorites
  bool _isProductInFavorites(ProductInputEntity product) {
    return _favorites.any((p) => p.code == product.code);
  }

  // Check if a product is in favorites (public method)
  bool isProductInFavorites(ProductInputEntity product) {
    return _isProductInFavorites(product);
  }

  // Get all favorite products
  List<ProductInputEntity> get favorites => _favorites;
}

import 'package:bloc/bloc.dart';
import 'package:commerce_hub/core/entity/product_input_entity.dart';
import 'package:commerce_hub/feature/profile/logic/favorites_cubit/favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial()) {
    // Initialize with empty favorites list
    emit(const FavoritesLoaded(favorites: []));
  }

  // List to store favorite products
  final List<ProductInputEntity> _favorites = [];

  // Add a product to favorites
  void addToFavorites(ProductInputEntity product) {
    try {
      // Check if product is already in favorites
      if (!_isProductInFavorites(product)) {
        _favorites.add(product);
        emit(FavoritesLoaded(favorites: List.from(_favorites)));
      }
    } catch (e) {
      emit(FavoritesError(message: e.toString()));
    }
  }

  // Remove a product from favorites
  void removeFromFavorites(ProductInputEntity product) {
    try {
      _favorites.removeWhere((p) => p.code == product.code);
      emit(FavoritesLoaded(favorites: List.from(_favorites)));
    } catch (e) {
      emit(FavoritesError(message: e.toString()));
    }
  }

  // Toggle a product's favorite status
  void toggleFavorite(ProductInputEntity product) {
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
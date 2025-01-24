part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsFaulier extends ProductsState {
  final String errmessage;
  ProductsFaulier(this.errmessage);
}

final class ProductsSuccess extends ProductsState {
  final List<ProductInputEntity> products;
  ProductsSuccess(this.products);
}

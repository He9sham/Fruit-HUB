import 'package:bloc/bloc.dart';
import 'package:commerce_hub/core/entity/product_input_entity.dart';
import 'package:commerce_hub/core/repos/product_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepo) : super(ProductsInitial());
  final ProductRepo productRepo;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    try {
      final result = await productRepo.getProducts();
      result.fold(
        (failure) => emit(ProductsFaulier(failure.toString())),
        (products) => emit(ProductsSuccess(products)),
      );
    } catch (e) {
      emit(ProductsFaulier(e.toString()));
    }
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    try {
      final result = await productRepo.getProducts();
      result.fold(
        (failure) => emit(ProductsFaulier(failure.toString())),
        (products) => emit(ProductsSuccess(products)),
      );
    } catch (e) {
      emit(ProductsFaulier(e.toString()));
    }
  }
}

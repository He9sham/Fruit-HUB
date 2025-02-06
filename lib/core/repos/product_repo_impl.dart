import 'package:commerce_hub/core/entity/product_input_entity.dart';
import 'package:commerce_hub/core/errors/failures.dart';
import 'package:commerce_hub/core/models/product_input_models.dart';
import 'package:commerce_hub/core/networking/backend_endpoints.dart';
import 'package:commerce_hub/core/repos/product_repo.dart';
import 'package:commerce_hub/core/service/database_service.dart';
import 'package:dartz/dartz.dart';

class ProductRepoImpl extends ProductRepo {
  final DatabaseService databaseService;
  ProductRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, List<ProductInputEntity>>>
      getBestSellingProducts() async {
    try {
      var data = await databaseService.getData(
          path: BackendEndpoints.getProduct,
          query: {
            'limit': 10,
            'orderBy': 'sellingCount',
            'descending': true
          }) as List<Map<String, dynamic>>;

      List<ProductInputEntity> products =
          data.map((e) => ProductModel.fromjson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to get products'));
    }

    //   List<ProductInputEntity> products = [];
    //   try {
    //     var data = await databaseService.getData(
    //       path: BackendEndpoints.getProduct,
    //       query: {
    //         'orderBy': 'sellingCount',
    //         'limit': 10,
    //         'descending': true,
    //       },
    //     ) as List<Map<String, dynamic>>;

    //     if (data.isNotEmpty) {
    //       products = data
    //           .map((e) {
    //             try {
    //               return ProductModel.fromjson(e).toEntity();
    //             } catch (error) {
    //               print('error: $error');
    //               return null;
    //             }
    //           })
    //           .whereType<ProductInputEntity>()
    //           .toList();

    //       print('products: ${products.length}');
    //     }

    //     return right(products);
    //   } catch (e) {
    //     return left(ServerFailure('فشل تحميل المنتجات'));
    //   }
  }

  @override
  Future<Either<Failure, List<ProductInputEntity>>> getProducts() async {
    try {
      var data = await databaseService.getData(
          path: BackendEndpoints.getProduct) as List<Map<String, dynamic>>;

      List<ProductInputEntity> products =
          data.map((e) => ProductModel.fromjson(e).toEntity()).toList();

      return right(products);
    } catch (e) {
      return left(ServerFailure('failed to get products'));
    }
  }
}

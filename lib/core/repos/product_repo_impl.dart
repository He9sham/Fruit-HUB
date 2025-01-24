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
  Future<Either<Failure, List<ProductInputEntity>>> getBestSellingProducts() {
    // TODO: implement getBestSellingProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductInputEntity>>> getProducts() async {
    try {
      var data = await databaseService.getData(
          path: BackendEndpoints.getProduct) as List<Map<String, dynamic>>;

      List<ProductInputEntity> products =
          data.map((e) => ProductModel.fromjson(e).toEntity()).toList();

      return Right(products);
    } catch (e) {
      return Left(ServerFailure('failed to get products'));
    }
  }
}

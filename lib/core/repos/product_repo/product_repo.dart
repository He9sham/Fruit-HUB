import 'package:commerce_hub/core/entity/product_input_entity.dart';
import 'package:commerce_hub/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductInputEntity>>> getProducts();
  Future<Either<Failure, List<ProductInputEntity>>> getBestSellingProducts();
}

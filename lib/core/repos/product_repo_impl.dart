import 'package:commerce_hub/core/entity/product_input_entity.dart';
import 'package:commerce_hub/core/errors/failures.dart';
import 'package:commerce_hub/core/repos/product_repo.dart';
import 'package:dartz/dartz.dart';

class ProductRepoImpl extends ProductRepo 
{
  @override
  Future<Either<Failure, List<ProductInputEntity>>> getBestSellingProducts() {
    // TODO: implement getBestSellingProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductInputEntity>>> getProducts() {
    
    throw UnimplementedError();
  }}
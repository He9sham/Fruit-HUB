import 'package:commerce_hub/core/errors/failures.dart';
import 'package:commerce_hub/feature/checkout/domain/entity/order_entity.dart';
import 'package:dartz/dartz.dart';

abstract class OrderRepo {

  Future<Either<Failure , void>> addOrder({required OrderEntity orderEntity});
}
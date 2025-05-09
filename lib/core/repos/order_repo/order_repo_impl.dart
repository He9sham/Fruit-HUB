import 'package:commerce_hub/core/errors/failures.dart';
import 'package:commerce_hub/core/networking/backend_endpoints.dart';
import 'package:commerce_hub/core/repos/order_repo/order_repo.dart';
import 'package:commerce_hub/core/service/database_service.dart';
import 'package:commerce_hub/feature/checkout/data/models/order_models.dart';
import 'package:commerce_hub/feature/checkout/domain/entity/order_entity.dart';
import 'package:dartz/dartz.dart';

class OrderRepoImpl implements OrderRepo {
  final DatabaseService fireStoreService;
  OrderRepoImpl({required this.fireStoreService});
  @override
  Future<Either<Failure, void>> addOrder(
      {required OrderInputEntity orderEntity}) async {
    try {
      var orderModels = OrderModels.fromEntity(orderEntity);
      await fireStoreService.addData(
          docementid: orderModels.orderId,
          path: BackendEndpoints.addOrder,
          data: orderModels.toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

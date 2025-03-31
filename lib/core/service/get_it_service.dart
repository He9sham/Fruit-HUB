import 'package:commerce_hub/core/repos/order_repo/order_repo.dart';
import 'package:commerce_hub/core/repos/order_repo/order_repo_impl.dart';
import 'package:commerce_hub/core/repos/product_repo/product_repo.dart';
import 'package:commerce_hub/core/repos/product_repo/product_repo_impl.dart';
import 'package:commerce_hub/core/service/database_service.dart';
import 'package:commerce_hub/core/service/firebase_database_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<DatabaseService>(FireStoreService());

  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(
      getIt<DatabaseService>(),
    ),
  );
  getIt.registerSingleton<OrderRepo>(
    OrderRepoImpl(
      fireStoreService: getIt<DatabaseService>(),
    ),
  );
}

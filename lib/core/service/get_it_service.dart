import 'package:commerce_hub/core/repos/order_repo/order_repo.dart';
import 'package:commerce_hub/core/repos/order_repo/order_repo_impl.dart';
import 'package:commerce_hub/core/repos/product_repo/product_repo.dart';
import 'package:commerce_hub/core/repos/product_repo/product_repo_impl.dart';
import 'package:commerce_hub/core/service/database_service.dart';
import 'package:commerce_hub/core/service/firebase_database_service.dart';
import 'package:commerce_hub/feature/profile/logic/favorites_cubit/favorites_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  // Register FavoritesCubit as a singleton to share across the app
  getIt.registerLazySingleton<FavoritesCubit>(() => FavoritesCubit());
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

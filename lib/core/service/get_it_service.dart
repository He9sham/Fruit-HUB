
import 'package:commerce_hub/core/repos/product_repo.dart';
import 'package:commerce_hub/core/repos/product_repo_impl.dart';
import 'package:commerce_hub/core/service/database_service.dart';
import 'package:commerce_hub/core/service/firebase_database_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  
  getIt.registerSingleton<DatabaseService>(FirebaseDatabaseService());
  
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(
      getIt<DatabaseService>(),
    ),
  );
}
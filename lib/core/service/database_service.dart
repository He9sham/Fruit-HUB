import 'package:commerce_hub/core/service/user_entity.dart';

abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    required String docementid,
  });

  Future<dynamic> getData({
     String docementid,
    required String path,
  });

  Future saveUserData({required UserEntity user});
}

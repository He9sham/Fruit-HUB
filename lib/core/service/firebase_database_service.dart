import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce_hub/core/service/database_service.dart';

class FirebaseDatabaseService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path, required Map<String, dynamic> data}) async {
    await firestore.collection(path).add(data);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce_hub/core/service/database_service.dart';

class FirebaseDatabaseService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? docementid}) async {
    if (docementid != null) {
      await firestore.collection(path).doc(docementid).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String docementid, required String path}) async {
    var data = await firestore.collection(path).doc(docementid).get();

    return data.data() as Map<String, dynamic>;
  }
}

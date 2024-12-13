import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce_hub/constants.dart';
import 'package:commerce_hub/core/service/database_service.dart';
import 'package:commerce_hub/core/service/shared_preferences_singleton.dart';
import 'package:commerce_hub/core/service/user_entity.dart';
import 'package:commerce_hub/core/service/user_models.dart';

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

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());

    await Prefs.setString(kUserData, jsonData);
  }
}

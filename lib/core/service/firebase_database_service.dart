import 'dart:convert';
import 'dart:math';

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
  Future<dynamic> getData({String? docementid, required String path}) async {
    if (docementid != null) {
      var data = await firestore.collection(path).doc(docementid).get();
      return data.data();
    } else {
      var data = await firestore.collection(path).get();
      return data.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());

    await Prefs.setString(kUserData, jsonData);
  }
}

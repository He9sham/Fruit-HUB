import 'dart:convert';

import 'package:commerce_hub/constants.dart';
import 'package:commerce_hub/core/service/shared_preferences_singleton.dart';
import 'package:commerce_hub/core/service/user_entity.dart';
import 'package:commerce_hub/core/service/user_models.dart';

UserEntity getuser() {
  var jsonString = Prefs.getString(kUserData);
  var userentity = UserModel.fromJson(jsonDecode(jsonString));

  return userentity;
}

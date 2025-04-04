import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:commerce_hub/core/helper/awesome_widgets.dart';
import 'package:commerce_hub/core/helper/extensions.dart';
import 'package:commerce_hub/core/networking/backend_endpoints.dart';
import 'package:commerce_hub/core/notification_service/local_notification_service.dart';
import 'package:commerce_hub/core/service/firebase_database_service.dart';
import 'package:commerce_hub/core/service/user_entity.dart';
import 'package:commerce_hub/core/service/user_models.dart';
import 'package:commerce_hub/core/utils/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FireStoreService firebaseDatabaseService = FireStoreService();
  NotificationService notificationService = NotificationService();
  bool isloading = false;
  final formkey = GlobalKey<FormState>();
 /// This method is used to validate the email and password fields in the login form.
  Future<void> loginMethod() async {
    UserCredential user;
    FireStoreService firebaseDatabaseService = FireStoreService();
    emit(LoginLoading());
    try {
      user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      var userEntity = await getUserData(uid: user.user!.uid);
      firebaseDatabaseService.saveUserData(user: userEntity);
      await notificationService.showInstantNotification(
          2, 'مرحبا بك', 'هل انت مستعد ابدا التسوق؟');
      // await notificationService.localNotificationsPlugin.cancel(2);
      emit(LoginSuccess());
    } on FirebaseAuthException {
      emit(LoginFailer(
          errMessage: 'البريد الالكتروني او كلمة المرور غير صحيحة'));
    } catch (e) {
      emit(LoginFailer(
          errMessage:
              'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى في وقت لاحق.'));
    }
  }
   /// This method uses the GoogleSignIn package to log in the user with their Google account.
  Future signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return;
      }
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      // ignore: use_build_context_synchronously
      context.pushNamed(Routes.homeScreen);
    } on Exception {
      awesomeWidgets(
        // ignore: use_build_context_synchronously
        context,
        DialogType.error,
        'خطأ',
        'حدث خطأ غير متوقع. يرجى المحاولة مرة اخرى في وقت لاحق',
      );
    }
  }

  /// This method uses the FacebookAuth package to log in the user with their Facebook account.
    Future<void> loginWithFacebook() async {
  try {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {

      // Firebase authentication Proof
      final AccessToken accessToken = result.accessToken!;
      log('Access token: ${accessToken.tokenString}');

      // Get user's data using the access token
      final profile = await FacebookAuth.i.getUserData();
      log('Hello, ${profile['name']}! You have successfully logged in with Facebook.');
    } else {
      log('Login failed.');
    }
  } catch (e) {
    log(e.toString());
  }
}



  Future<UserEntity> getUserData({required String uid}) async {
    var data = await firebaseDatabaseService.getData(
        docementid: uid, path: BackendEndpoints.getuserdata);
    return UserModel.fromJson(data);
  }
}

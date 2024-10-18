import 'package:bloc/bloc.dart';
import 'package:commerce_hub/core/notification_service/local_notification_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formkey = GlobalKey<FormState>();
  Future<void> loginMethod() async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      emit(LoginSuccess());
    } on FirebaseAuthException {
      emit(
          LoginFailer(errMessage: 'ربما الحساب الالكتروني او كلمة المرور خطأ'));
    } catch (e) {
      emit(LoginFailer(
          errMessage:
              'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى في وقت لاحق.'));
    }
  }
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
      // Navigator.pushNamed(context, AddKidView.addkidid);
      NotificationService notificationService = NotificationService();
      await notificationService.showInstantNotification(
          5, 'Welcome', 'How are you today?');
    } on Exception {
      NotificationService notificationService = NotificationService();
      await notificationService.showInstantNotification(
          6, 'Sorry', 'Please tru leater!');
    }
  }
}

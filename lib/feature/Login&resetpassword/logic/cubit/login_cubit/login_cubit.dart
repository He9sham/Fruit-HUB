import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:commerce_hub/core/helper/awesome_widgets.dart';
import 'package:commerce_hub/core/helper/extensions.dart';
import 'package:commerce_hub/core/utils/router.dart';
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
      emit(LoginFailer(
          errMessage: 'كلمة المرور او البريد الالكتروني غير صحيحة'));
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
}


// platform Exception(sign_in_failed.google.android.gms.common.api.ApiException:10: , null , null)
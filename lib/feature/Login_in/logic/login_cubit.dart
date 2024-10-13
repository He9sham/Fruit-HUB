import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
}

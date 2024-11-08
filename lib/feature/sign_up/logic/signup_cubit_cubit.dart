import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'signup_cubit_state.dart';

class SignupCubit extends Cubit<SignupCubitState> {
  SignupCubit() : super(SignupCubitInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? isloading = true;
  final formkey = GlobalKey<FormState>();
  Future<void> signupMethod() async {
    emit(SignupCubitLoading());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      emit(SignupCubitSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(SignupCubitFailure(errMessage: 'هذا الحساب مسجل بلفعل '));
      }
    } catch (e) {
      emit(SignupCubitFailure(errMessage: 'An error , please try agian later'));
    }
  }
}

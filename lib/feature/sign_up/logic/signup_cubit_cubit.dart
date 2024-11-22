import 'package:bloc/bloc.dart';
import 'package:commerce_hub/core/networking/backend_endpoints.dart';
import 'package:commerce_hub/core/service/firebase_database_service.dart';
import 'package:commerce_hub/core/service/user_entity.dart';
import 'package:commerce_hub/core/service/user_models.dart';
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
      var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      var userEntity = UserModel.fromFirebaseUser(user.user!);
      await addUserData(user: userEntity);
      emit(SignupCubitSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(SignupCubitFailure(errMessage: 'هذا الحساب مسجل بلفعل '));
      }
    } catch (e) {
      emit(SignupCubitFailure(errMessage: 'An error , please try agian later'));
    }
  }

  Future<void> addUserData({required UserEntity user}) async {
    await FirebaseDatabaseService()
        .addData(path: BackendEndpoints.addUserdata, data: user.tomap());
  }
}

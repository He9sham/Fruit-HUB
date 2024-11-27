import 'package:bloc/bloc.dart';
import 'package:commerce_hub/core/networking/backend_endpoints.dart';
import 'package:commerce_hub/core/service/firebase_database_service.dart';
import 'package:commerce_hub/core/service/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'signup_cubit_state.dart';

class SignupCubit extends Cubit<SignupCubitState> {
  SignupCubit() : super(SignupCubitInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseDatabaseService firebaseDatabaseService = FirebaseDatabaseService();
  final formkey = GlobalKey<FormState>();
  Future<void> signupMethod() async {
    UserCredential? user;
    emit(SignupCubitLoading());
    try {
      user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      var userEntity = UserEntity(
        name: nameController.text,
        email: emailController.text,
        uid: user.user!.uid,
      );
      await addUserData(user: userEntity);
      emit(SignupCubitSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(SignupCubitFailure(errMessage: 'هذا الحساب مسجل بلفعل '));
      } else if (e.code == 'weak-password') {
        emit(SignupCubitFailure(
            errMessage: 'يجب أن تكون كلمة المرور مكونة من 6 أحرف على الأقل'));
      } else if (e.code == 'network-request-failed') {
        emit(SignupCubitFailure(errMessage: 'تاكد من اتصالك بالانترنت'));
      }
      if (user != null) {
        await user.user!.delete();
      }
    } catch (e) {
      if (user != null) {
        await user.user!.delete();
      }
      emit(SignupCubitFailure(errMessage: 'An error , please try agian later'));
    }
  }

  Future<void> addUserData({required UserEntity user}) async {
    await firebaseDatabaseService.addData(
      path: BackendEndpoints.addUserdata,
      data: user.tomap(),
      docementid: user.uid,
    );
  }

  Future<void> deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }
}

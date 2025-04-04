import 'package:bloc/bloc.dart';
import 'package:commerce_hub/core/networking/backend_endpoints.dart';
import 'package:commerce_hub/core/notification_service/local_notification_service.dart';
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
  FireStoreService firebaseDatabaseService = FireStoreService();
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
      NotificationService notificationService = NotificationService();
      await notificationService.showInstantNotification(
          2, 'مرحبا بك', 'هل انت مستعد ابدا التسوق؟');
      await notificationService.localNotificationsPlugin.cancel(2);
      emit(SignupCubitSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(SignupCubitFailure(errMessage: 'هذا الحساب مسجل بالفعل '));
      } else if (e.code == 'weak-password') {
        emit(SignupCubitFailure(
            errMessage: 'يجب أن تحتوي كلمة المرور على 6 أحرف على الأقل'));
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
      emit(SignupCubitFailure(errMessage: 'An error, please try again later'));
    }
  }

  Future<void> addUserData({required UserEntity user}) async {
    await firebaseDatabaseService.addData(
      path: BackendEndpoints.addUserdata,
      data: UserModel.fromEntity(user).toMap(),
      docementid: user.uid,
    );
  }

  Future<void> deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

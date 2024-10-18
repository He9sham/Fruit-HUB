import 'package:bloc/bloc.dart';
import 'package:commerce_hub/core/helper/authstatus_enum.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'resetpassword_state.dart';

class ResetpasswordCubit extends Cubit<ResetpasswordState> {
  ResetpasswordCubit() : super(ResetpasswordInitial());
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  static final auth = FirebaseAuth.instance;
  static late AuthStatus status;
  TextEditingController resetemailController = TextEditingController();
  Future<AuthStatus> resetPassword() async {
    emit(ResetpasswordLoading());
    try {
      await auth.sendPasswordResetEmail(email: resetemailController.text);
      status = AuthStatus.successful;
      emit(ResetpasswordSuccess());
    } on FirebaseAuthException catch (err) {
      emit(ResetpasswordFailure(err.message.toString()));
    } catch (err) {
      throw Exception(err.toString());
    }
    return status;
  }
}

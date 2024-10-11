import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'signup_cubit_state.dart';

class SignupCubit extends Cubit<SignupCubitState> {
  SignupCubit() : super(SignupCubitInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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

  //   Future signInWithGoogle(BuildContext context) async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     if (googleUser == null) {
  //       return;
  //     }
  //     // Obtain the auth details from the request
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;

  //     // Create a new credential
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );

  //     // Once signed in, return the UserCredential
  //     await FirebaseAuth.instance.signInWithCredential(credential);

  //     // ignore: use_build_context_synchronously
  //     Navigator.pushNamed(context, AddKidView.addkidid);
  //     NotificationService notificationService = NotificationService();
  //     await notificationService.showInstantNotification(
  //         5, 'Welcome', 'How are you today?');
  //   } on Exception {
  //     NotificationService notificationService = NotificationService();
  //     await notificationService.showInstantNotification(
  //         6, 'Sorry', 'Please tru leater!');
  //   }
  // }
}

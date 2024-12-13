import 'package:firebase_auth/firebase_auth.dart';

bool isloggedIn() {
  return FirebaseAuth.instance.currentUser != null;
}

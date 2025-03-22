import 'package:commerce_hub/core/helper/extensions.dart';
import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/utils/router.dart';
import 'package:commerce_hub/core/widgets/snackbar_widget.dart';
import 'package:commerce_hub/feature/Login&resetpassword/logic/cubit/login_cubit/login_cubit.dart';
import 'package:commerce_hub/feature/Login&resetpassword/view/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignOutContainer extends StatelessWidget {
  const SignOutContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await signoutUser(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFFEBF9F1),
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            horizontalSpace(60),
            Text(
              'تسجيل الخروج',
              style: const TextStyle(
                color: Color(0xFF1B5E37),
                fontSize: 13,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w600,
                height: 0.12,
              ),
            ),
            horizontalSpace(60),
            Icon(
              FontAwesomeIcons.arrowRightFromBracket,
              color: Colors.green.shade300,
            )
          ],
        ),
      ),
    );
  }

  Future<void> signoutUser(BuildContext context) async {
    if (FirebaseAuth.instance.currentUser != null) {
      await FirebaseAuth.instance.signOut();
      // ignore: use_build_context_synchronously
      context.pushNamedAndRemoveUntil(
        Routes.loginScreen,
        predicate: (route) => false,
        arguments: MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(),
            child: LoginView(),
          ),
        ),
      );
    } else {
      showSnackBar(context, 'حدث خطأ ما');
    }
  }
}

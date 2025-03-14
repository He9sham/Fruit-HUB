import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignOutContainer extends StatelessWidget {
  const SignOutContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (FirebaseAuth.instance.currentUser != null) {
          await FirebaseAuth.instance.signOut();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('حدث خطأ ما'),
            ),
          );
        }
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

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

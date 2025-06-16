import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/networking/backend_endpoints.dart';
import 'package:commerce_hub/core/service/user_models.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppbarHomeview extends StatelessWidget {
  const CustomAppbarHomeview({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection(BackendEndpoints.getuserdata)
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('حدث خطأ ما');
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const CircularProgressIndicator();
        }

        final userData =
            UserModel.fromJson(snapshot.data!.data() as Map<String, dynamic>);

        return Row(
          textDirection: TextDirection.rtl,
          children: [
            Image.asset('assets/image/image_png/Mask group.png'),
            horizontalSpace(5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '..!صباح الخير',
                  style: Styles.textRowNavigate16gray,
                ),
                Text(
                  userData.name,
                  style: Styles.textSize13Black600
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 14),
                ),
              ],
            ),
            horizontalSpace(140),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.withValues(alpha: 0.4),
              ),
              child: const Icon(FontAwesomeIcons.bell),
            )
          ],
        );
      },
    );
  }
}

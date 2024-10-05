import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerRow extends StatelessWidget {
  const DividerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        children: [
          Positioned(
            child: Divider(
              endIndent: 5,
              indent: 200,
              thickness: 2,
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Positioned(
            right: 165.w,
            bottom: 5.h,
            child: const Text(
              'او',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            child: Divider(
              endIndent: 200,
              indent: 5,
              thickness: 2,
              color: Colors.black.withOpacity(0.3),
            ),
          ),
        ],
      ),
    );
  }
}

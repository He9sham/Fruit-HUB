import 'package:commerce_hub/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomViewBestSeller extends StatefulWidget {
  const CustomViewBestSeller({super.key});

  @override
  State<CustomViewBestSeller> createState() => _CustomViewBestSellerState();
}

class _CustomViewBestSellerState extends State<CustomViewBestSeller> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 241.h,
      width: 170.w,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: Stack(
        textDirection: TextDirection.rtl,
        children: [
          IconButton(
            onPressed: () {
              toggleHeartColor();
            },
            icon: Icon(
              FontAwesomeIcons.heartCircleCheck,
              color: _isPressed ? Colors.red : Colors.black,
            ),
          ),
          Positioned(
            top: 8.h,
            right: 40.w,
            child: Image.asset('assets/image/image 29.png'),
          ),
          Positioned(
            top: 116.h,
            right: 111.w,
            child: Container(
              width: 45.w,
              height: 45.h,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(60),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.plus,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 115.h,
            right: 15.w,
            child: Text(
              'فروله',
              style: Styles.textSize13Black600,
            ),
          ),
          Positioned(
            top: 140.h,
            right: 15.w,
            child: Text(
              'جنية / الكيلو',
              style: Styles.textSize13Black600.copyWith(
                  color: Colors.yellow.shade800, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  bool _isPressed = false;

  void toggleHeartColor() {
    setState(() {
      _isPressed = !_isPressed;
    });
  }
}

import 'package:commerce_hub/core/entity/product_input_entity.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomViewBestSeller extends StatefulWidget {
  const CustomViewBestSeller({
    super.key,
    required this.productInputEntity,
  });

  final ProductInputEntity productInputEntity;
  @override
  State<CustomViewBestSeller> createState() => _CustomViewBestSellerState();
}

class _CustomViewBestSellerState extends State<CustomViewBestSeller> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.3,
      width: MediaQuery.sizeOf(context).width * 0.5,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: Stack(
        textDirection: TextDirection.rtl,
        children: [
          Positioned(
            top: 8.h,
            child: IconButton(
              onPressed: () {
                toggleHeartColor();
              },
              icon: Icon(
                _isPressed
                    ? FontAwesomeIcons.solidHeart
                    : FontAwesomeIcons.heart,
                color: _isPressed ? Colors.red : Colors.black,
              ),
            ),
          ),
          Positioned(
            top: 15.h,
            right: 25.w,
            child: widget.productInputEntity.imageUrl != null
                ? Image.network(
                    widget.productInputEntity.imageUrl!,
                    width: 150.w,
                    height: 130.h,
                  )
                : SizedBox(
                    width: 100.w,
                    height: 100.h,
                  ),
          ),
          Positioned(
            top: 175.h,
            right: 105.w,
            child: Container(
              width: 40.w,
              height: 40.h,
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
            top: 175.h,
            right: 19.w,
            child: Text(
              widget.productInputEntity.name,
              style: Styles.textSize13Black600,
            ),
          ),
          Positioned(
            top: 195.h,
            right: 19.w,
            child: Text(
              widget.productInputEntity.price.toString(),
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

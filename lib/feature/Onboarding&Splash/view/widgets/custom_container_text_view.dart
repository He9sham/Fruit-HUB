import 'package:commerce_hub/core/helper/spacing.dart';
import 'package:commerce_hub/core/theming/styles.dart';
import 'package:flutter/material.dart';

class CustomContainerTextView extends StatelessWidget {
  const CustomContainerTextView(
      {super.key, required this.title1, required this.title2, required this.title3, required this.subtitle});
  final String title1 , title2 , title3, subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: sizeOfHeight(0.55, context),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: title1,
                  style: Styles.textonbording23.copyWith(
                    color: Colors.green,
                  ),
                ),
                TextSpan(
                  text: title2,
                  style: Styles.textonbording23.copyWith(
                    color: Colors.yellow,
                  ),
                ),
                TextSpan(
                  text: title3,
                  style: Styles.textonbording23,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: Styles.textonbording13,
          ),
        ],
      ),
    );
  }
}

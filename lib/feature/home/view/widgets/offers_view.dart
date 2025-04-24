import 'package:commerce_hub/feature/home/view/widgets/offer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for offers - in a real app, this would come from a repository or API
    final List<Map<String, dynamic>> offerItems = [
      {
        'title': 'خصومات خاصة',
        'description': 'خصم 20% على جميع الفواكه',
        'imageUrl':
            'assets/image/image_png/Watermelon.png',
        'backgroundColor': Colors.orange.shade100,
      },
      {
        'title': 'عروض حصرية',
        'description': 'اشترِ 2 واحصل على 1 مجانًا',
        'imageUrl': 'assets/image/image_png/Avocado-PNG-Clipart 1.png',
        'backgroundColor': Colors.green.shade100,
      },
      {
        'title': 'القادمون الجدد',
        'description': 'فواكه موسمية طازجة',
        'imageUrl':
            'assets/image/image_png/pineapple-fruit-transparent-background-free-png 1.png',
        'backgroundColor': Colors.blue.shade100,
      },
      {
        'title': 'وقت محدود',
        'description': 'فواكه عالية الجودة',
        'imageUrl': 'assets/image/image_png/Bitmap.png',
        'backgroundColor': Colors.purple.shade100,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 160.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: offerItems.length,
            itemBuilder: (context, index) {
              final offer = offerItems[index];
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: OfferCard(
                  title: offer['title'],
                  description: offer['description'],
                  imageUrl: offer['imageUrl'],
                  backgroundColor: offer['backgroundColor'],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

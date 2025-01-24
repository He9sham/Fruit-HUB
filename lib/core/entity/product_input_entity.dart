import 'dart:io';

import 'package:commerce_hub/core/entity/review_entity.dart';

class ProductInputEntity {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final int sellingCount;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final List<ReviewEntity> reviews;

  ProductInputEntity(
      {required this.reviews,
      required this.name,
      this.sellingCount = 0,
      required this.code,
      required this.description,
      required this.price,
      required this.expirationsMonths,
      required this.numberOfCalories,
      required this.unitAmount,
      this.isOrganic = false,
      required this.image,
      required this.isFeatured,
      this.imageUrl});
}

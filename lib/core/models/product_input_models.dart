import 'dart:io';

import 'package:commerce_hub/core/entity/product_input_entity.dart';
import 'package:commerce_hub/core/models/reivew_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final int sellingCount;
  final List<ReviewModel> reviews;

  ProductModel(
      {required this.name,
      required this.reviews,
      required this.code,
      required this.description,
      required this.expirationsMonths,
      required this.numberOfCalories,
      required this.unitAmount,
      required this.price,
      this.sellingCount = 0,
      required this.isOrganic,
      required this.image,
      required this.isFeatured,
      this.imageUrl});

  factory ProductModel.fromEntity(ProductInputEntity addProductInputEntity) {
    return ProductModel(
      name: addProductInputEntity.name,
      code: addProductInputEntity.code,
      description: addProductInputEntity.description,
      sellingCount: addProductInputEntity.sellingCount,
      price: addProductInputEntity.price,
      isOrganic: addProductInputEntity.isOrganic,
      image: addProductInputEntity.image,
      expirationsMonths: addProductInputEntity.expirationsMonths,
      numberOfCalories: addProductInputEntity.numberOfCalories,
      unitAmount: addProductInputEntity.unitAmount,
      isFeatured: addProductInputEntity.isFeatured,
      imageUrl: addProductInputEntity.imageUrl,
      reviews: addProductInputEntity.reviews
          .map((e) => ReviewModel.fromEntity(e))
          .toList(),
    );
  }
  factory ProductModel.fromjson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      code: json['code'],
      description: json['description'],
      sellingCount: json['sellingCount'],
      price: json['price'],
      isOrganic: json['isOrganic'],
      image: File(json['imageUrl']),
      expirationsMonths: json['expirationsMonths'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
      reviews: json['reviews']
          .map<ReviewModel>((e) => ReviewModel.fromJson(e))
          .toList(),
    );
  }

  ProductInputEntity toEntity()
  {
    return ProductInputEntity(
      name: name,
      code: code,
      description: description,
      sellingCount: sellingCount,
      price: price,
      isOrganic: isOrganic,
      image: image,
      expirationsMonths: expirationsMonths,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
      reviews: reviews.map((e) => e.toEntity()).toList()
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'sellingCount': sellingCount,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonths': expirationsMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList()
    };
  }
}

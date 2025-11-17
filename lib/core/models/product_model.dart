import 'dart:io';

import 'package:fruits_hub/core/models/review_model.dart';

import '../entities/product_entity.dart';

class ProductModel {
  final String productName;
  final String productCode;
  final String productDescription;
  final num productPrice;
  final num avgRating = 0;
  final num avgCount = 0;
  final int expirationMonths;
  final int numberOfCalories;
  final int unitAmount;
  final File image;
  final String? imageUrl;
  final bool isFeatured;
  final bool isOrganic;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.productName,
    required this.productCode,
    required this.productDescription,
    required this.productPrice,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.image,
    this.imageUrl,
    required this.isFeatured,
    this.isOrganic = false,
    required this.reviews,
  });

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      productName: entity.productName,
      productCode: entity.productCode,
      productDescription: entity.productDescription,
      productPrice: entity.productPrice,
      expirationMonths: entity.expirationMonths,
      numberOfCalories: entity.numberOfCalories,
      unitAmount: entity.unitAmount,
      image: entity.image,
      imageUrl: entity.imageUrl,
      isFeatured: entity.isFeatured,
      isOrganic: entity.isOrganic,
      reviews: entity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
    );
  }

  toJSon() {
    return {
      "productName": productName,
      "productCode": productCode,
      "productDescription": productDescription,
      "productPrice": productPrice,
      "expirationMonths": expirationMonths,
      "numberOfCalories": numberOfCalories,
      "unitAmount": unitAmount,
      "imageUrl": imageUrl,
      "isFeatured": isFeatured,
      "isOrganic": isOrganic,
      "reviews": reviews.map((e) => e.toJson()).toList(),
    };
  }
}

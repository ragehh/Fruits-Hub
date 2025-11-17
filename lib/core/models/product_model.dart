import 'dart:io';

import 'package:fruits_hub/core/models/review_model.dart';

class ProductModel {
  final String productName;
  final String productCode;
  final String productDescription;
  final num productPrice;
  final num avgRating = 0;
  final num avgCount = 0;
  final num sellingCount;

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
    this.sellingCount = 0,
    required this.image,
    this.imageUrl,
    required this.isFeatured,
    this.isOrganic = false,
    required this.reviews,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json['productName'],
      productCode: json['productCode'],
      productDescription: json['productDescription'],
      productPrice: json['productPrice'],
      expirationMonths: json['expirationMonths'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      sellingCount: json['sellingCount'],
      image: json['image'],
      imageUrl: json['imageUrl'],
      isFeatured: json['isFeatured'],
      isOrganic: json['isOrganic'],
      reviews: json['reviews'] != null
          ? json['reviews'].map((e) => ReviewModel.fromJson(e)).toList()
          : [],
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
      "sellingCount": sellingCount,
      "imageUrl": imageUrl,
      "isFeatured": isFeatured,
      "isOrganic": isOrganic,
      "reviews": reviews.map((e) => e.toJson()).toList(),
    };
  }
}

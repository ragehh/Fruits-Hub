import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/models/review_model.dart';

import '../helper_functions/get_avg_rating.dart';

class ProductModel {
  final String productName;
  final String productCode;
  final String productDescription;
  final num productPrice;
  final num avgRating;
  final num avgCount = 0;
  final num sellingCount;
  final int expirationMonths;
  final int numberOfCalories;
  final int unitAmount;
  final String? imageUrl;
  final bool isFeatured;
  final bool isOrganic;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.productName,
    required this.productCode,
    required this.productDescription,
    required this.productPrice,
    required this.avgRating,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.sellingCount = 0,
    this.imageUrl,
    required this.isFeatured,
    this.isOrganic = false,
    required this.reviews,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<ReviewModel> reviews = <ReviewModel>[];

    // Safely parse reviews
    if (json['reviews'] != null && json['reviews'] is List) {
      try {
        reviews = (json['reviews'] as List)
            .where((e) => e != null && e is Map<String, dynamic>)
            .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
            .cast<ReviewModel>()
            .toList();
      } catch (e) {
        // If parsing fails, use empty list
        reviews = <ReviewModel>[];
      }
    }

    final reviewEntities = reviews.map((e) => e.toEntity()).toList();

    return ProductModel(
      productName: json['productName'] ?? '',
      productCode: json['productCode'] ?? '',
      productDescription: json['productDescription'] ?? '',
      productPrice: json['productPrice'] ?? 0,
      avgRating: reviewEntities.isNotEmpty ? getAvgRating(reviewEntities) : 0,
      expirationMonths: json['expirationMonths'] ?? 0,
      numberOfCalories: json['numberOfCalories'] ?? 0,
      unitAmount: json['unitAmount'] ?? 0,
      sellingCount: json['sellingCount'] ?? 0,
      imageUrl: json['imageUrl'],
      isFeatured: json['isFeatured'] ?? false,
      isOrganic: json['isOrganic'] ?? false,
      reviews: reviews,
    );
  }

  // factory ProductModel.fromJson(Map<String, dynamic> json) {
  //   return ProductModel(
  //     productName: json['productName'],
  //     productCode: json['productCode'],
  //     productDescription: json['productDescription'],
  //     productPrice: json['productPrice'],
  //     avgRating: getAvgRating(json['reviews']),
  //     expirationMonths: json['expirationMonths'],
  //     numberOfCalories: json['numberOfCalories'],
  //     unitAmount: json['unitAmount'],
  //     sellingCount: json['sellingCount'],
  //     imageUrl: json['imageUrl'],
  //     isFeatured: json['isFeatured'],
  //     isOrganic: json['isOrganic'],
  //     reviews: json['reviews'] != null
  //         ? json['reviews'].map((e) => ReviewModel.fromJson(e)).toList()
  //         : [],
  //   );
  // }

  ProductEntity toEntity() {
    return ProductEntity(
      productName: productName,
      productCode: productCode,
      productDescription: productDescription,
      productPrice: productPrice,
      expirationMonths: expirationMonths,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      imageUrl: imageUrl,
      isFeatured: isFeatured,
      isOrganic: isOrganic,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }

  Map<String, Object?> toJSon() {
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

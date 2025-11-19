import 'package:fruits_hub/core/entities/review_entity.dart';

class ProductEntity {
  final String productName;
  final String productCode;
  final String productDescription;
  final num productPrice;
  final num avgRating = 0;
  final num avgCount = 0;
  final int expirationMonths;
  final int numberOfCalories;
  final int unitAmount;
  String? imageUrl;
  final bool isFeatured;
  final bool isOrganic;
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.productName,
    required this.productCode,
    required this.productDescription,
    required this.productPrice,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.imageUrl,
    required this.isFeatured,
    this.isOrganic = false,
    required this.reviews,
  });
}

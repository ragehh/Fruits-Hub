import 'package:fruits_hub/core/entities/product_entity.dart';

class CartItemEntity {
  CartItemEntity({required this.productEntity, this.count = 0});

  final ProductEntity productEntity;
  int count;

  num calculateTotalPrice() => productEntity.productPrice * count;

  num calculateTotalWeight() => productEntity.unitAmount * count;

  int increaseCount() => count++;

  int decreaseCount() => count--;
}

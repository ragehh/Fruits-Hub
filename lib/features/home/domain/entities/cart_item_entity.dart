import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';

class CartItemEntity extends Equatable {
  CartItemEntity({required this.productEntity, this.count = 0});

  @override
  List<Object?> get props => [productEntity];

  final ProductEntity productEntity;
  int count;

  num calculateTotalPrice() => productEntity.productPrice * count;

  num calculateTotalWeight() => productEntity.unitAmount * count;

  int increaseCount() => count++;

  int decreaseCount() => count--;
}

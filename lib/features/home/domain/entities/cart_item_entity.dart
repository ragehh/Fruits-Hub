import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';

class CartItemEntity extends Equatable {
  CartItemEntity({required this.productEntity, this.quantity = 0});

  @override
  List<Object?> get props => [productEntity];

  final ProductEntity productEntity;
  int quantity;

  num calculateTotalPrice() => productEntity.productPrice * quantity;

  num calculateTotalWeight() => productEntity.unitAmount * quantity;

  int increaseQuantity() => quantity++;

  int decreaseQuantity() => quantity--;
}

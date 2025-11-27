import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final int quantity;
  final double price;
  final String imageUrl;

  OrderProductModel({
    required this.name,
    required this.code,
    required this.quantity,
    required this.price,
    required this.imageUrl,
  });

  factory OrderProductModel.fromEntity(CartItemEntity entity) {
    return OrderProductModel(
      name: entity.productEntity.productName,
      code: entity.productEntity.productCode,
      quantity: entity.quantity,
      price: entity.productEntity.productPrice.toDouble(),
      imageUrl: entity.productEntity.imageUrl!,
    );
  }

  Map<String, Object> toJson() {
    return {
      'name': name,
      'code': code,
      'quantity': quantity,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}

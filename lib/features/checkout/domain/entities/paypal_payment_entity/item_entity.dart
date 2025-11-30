import '../../../../../core/helper_functions/get_currency.dart';
import '../../../../home/domain/entities/cart_item_entity.dart';

class ItemEntity {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemEntity({this.name, this.quantity, this.price, this.currency});

  factory ItemEntity.fromEntity(CartItemEntity cartItemEntity) {
    return ItemEntity(
      name: cartItemEntity.productEntity.productName,
      quantity: cartItemEntity.quantity,
      price: cartItemEntity.productEntity.productPrice.toString(),
      currency: getCurrency(),
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': currency,
  };
}

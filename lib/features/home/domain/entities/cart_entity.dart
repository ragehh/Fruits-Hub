import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

class CartEntity {
  CartEntity(this.cartItems);

  final List<CartItemEntity> cartItems;

  void addCartItem(CartItemEntity cartItem) {
    cartItems.add(cartItem);
  }
}

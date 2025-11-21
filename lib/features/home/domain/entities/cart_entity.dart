import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

import '../../../../core/entities/product_entity.dart';

class CartEntity {
  CartEntity(this.cartItems);

  final List<CartItemEntity> cartItems;

  void addCartItem(CartItemEntity cartItem) {
    cartItems.add(cartItem);
  }

  bool isExist(ProductEntity productEntity) {
    for (CartItemEntity cartItem in cartItems) {
      if (cartItem.productEntity == productEntity) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem(ProductEntity productEntity) {
    for (CartItemEntity cartItem in cartItems) {
      if (cartItem.productEntity == productEntity) {
        return cartItem;
      }
    }
    return CartItemEntity(productEntity: productEntity, count: 1);
  }
}

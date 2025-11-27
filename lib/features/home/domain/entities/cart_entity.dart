import 'package:equatable/equatable.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

import '../../../../core/entities/product_entity.dart';

class CartEntity extends Equatable {
  CartEntity(this.cartItems);

  final List<CartItemEntity> cartItems;

  void addCartItem(CartItemEntity cartItem) {
    cartItems.add(cartItem);
  }

  void removeCartItem(CartItemEntity cartItem) {
    cartItems.remove(cartItem);
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
    return CartItemEntity(productEntity: productEntity, quantity: 1);
  }

  num calculateTotalPrice() {
    num totalPrice = 0;
    for (CartItemEntity cartItem in cartItems) {
      totalPrice += cartItem.calculateTotalPrice();
    }
    return totalPrice;
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}

import 'package:fruits_hub/features/checkout/domain/entities/shipping_address_entity.dart';

import '../../../home/domain/entities/cart_entity.dart';

class OrderEntity {
  final String uId;
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity shippingAddressEntity;

  OrderEntity(
    this.cartEntity, {
    this.payWithCash,
    required this.shippingAddressEntity,
    required this.uId,
  });

  double calculateShippingCost() {
    if (payWithCash == true) {
      return 30;
    } else {
      return 0;
    }
  }

  double calculateDiscountPrice() {
    return 0;
  }

  double calculateTotalPriceAfterDiscountAndShipping() {
    return cartEntity.calculateTotalPrice() +
        calculateShippingCost() -
        calculateDiscountPrice();
  }
}

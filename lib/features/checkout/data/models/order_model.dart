import 'package:fruits_hub/features/checkout/data/models/order_product_model.dart';
import 'package:fruits_hub/features/checkout/data/models/shipping_address_model.dart';

import '../../domain/entities/order_entity.dart';

class OrderModel {
  final String uId;
  final List<OrderProductModel> orderProducts;
  final double totalPrice;
  final ShippingAddressModel shippingAddressModel;
  final String paymentMethod;

  OrderModel({
    required this.uId,
    required this.orderProducts,
    required this.totalPrice,
    required this.shippingAddressModel,
    required this.paymentMethod,
  });

  factory OrderModel.fromEntity(OrderEntity orderEntity) {
    return OrderModel(
      uId: orderEntity.uId,
      orderProducts: orderEntity.cartEntity.cartItems.map((e) {
        return OrderProductModel.fromEntity(e);
      }).toList(),
      totalPrice: orderEntity.cartEntity.calculateTotalPrice().toDouble(),
      shippingAddressModel: ShippingAddressModel.fromEntity(
        orderEntity.shippingAddressEntity,
      ),
      paymentMethod: orderEntity.payWithCash! ? 'Cash' : 'PayPal',
    );
  }

  Map<String, Object> toJson() {
    return {
      'uId': uId,
      'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
      'totalPrice': totalPrice,
      'shippingAddressModel': shippingAddressModel.toJson(),
      'paymentMethod': paymentMethod,
    };
  }
}

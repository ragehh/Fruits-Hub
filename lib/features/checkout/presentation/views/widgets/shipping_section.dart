import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
          },
          isSelected: selectedIndex == 0,
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price:
              '${(context.read<OrderEntity>().cartEntity.calculateTotalPrice() + 40).toString()} جنيه',
        ),
        SizedBox(height: 8),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
          isSelected: selectedIndex == 1,
          title: 'الدفع أونلاين',
          subTitle: 'يرجي تحديد طريقه الدفع',
          price:
              '${context.read<OrderEntity>().cartEntity.calculateTotalPrice().toString()} جنيه',
        ),
      ],
    );
  }
}

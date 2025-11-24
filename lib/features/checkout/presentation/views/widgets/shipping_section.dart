import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shipping_item.dart';

class ShippingSection extends StatelessWidget {
  const ShippingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ShippingItem(
          isSelected: true,
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: '40 جنيه',
        ),
        SizedBox(height: 8),
        ShippingItem(
          isSelected: false,
          title: 'الدفع أونلاين',
          subTitle: 'يرجي تحديد طريقه الدفع',
          price: 'مجاني',
        ),
      ],
    );
  }
}

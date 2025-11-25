import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/payment_item.dart';

import '../../../../../core/utils/app_text_styles.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'ملخص الطلب :',
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'المجموع الفرعي :',
                style: TextStyles.regular13.copyWith(color: Color(0xFF4E5556)),
              ),
              Spacer(),
              Text('150 جنيه', style: TextStyles.semiBold16),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                'التوصيل  :',
                style: TextStyles.regular13.copyWith(color: Color(0xFF4E5556)),
              ),
              Spacer(),
              Text(
                '30 جنية',
                style: TextStyles.regular13.copyWith(color: Color(0xFF4E5556)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Divider(color: Color(0xffCACECE)),
          const SizedBox(height: 8),
          Row(
            children: [
              Text('الكلي', style: TextStyles.bold16),
              Spacer(),
              Text('180 جنية', style: TextStyles.bold16),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_decorations.dart';

import '../../../../../core/utils/app_text_styles.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyles.bold13),
        const SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: AppDecorations.greyBoxDecorations,
          child: child,
        ),
      ],
    );
  }
}

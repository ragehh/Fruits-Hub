import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class InactiveCheckoutStepItem extends StatelessWidget {
  const InactiveCheckoutStepItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 10,
          backgroundColor: Color(0xFFF2F3F3),
          child: Text('2', style: TextStyles.semiBold13),
        ),
        const SizedBox(width: 4),
        Text(
          'العنوان',
          style: TextStyles.semiBold13.copyWith(color: Color(0xFFAAAAAA)),
        ),
      ],
    );
  }
}

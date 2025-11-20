import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

import '../../../../../core/utils/app_text_styles.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionButton(
          icon: IconButton(
            onPressed: () {},
            icon: Center(child: Icon(Icons.add, color: Colors.white, size: 50)),
          ),
          color: AppColors.primaryColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            '3',
            textAlign: TextAlign.center,
            style: TextStyles.bold13,
          ),
        ),
        CartItemActionButton(
          icon: IconButton(
            onPressed: () {},
            icon: Center(
              child: Icon(Icons.remove, color: Colors.grey, size: 50),
            ),
          ),
          color: Color(0xFFF3F5F7),
        ),
      ],
    );
  }
}

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton({
    super.key,
    required this.icon,
    required this.color,
  });

  final Widget icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      child: FittedBox(child: icon),
    );
  }
}

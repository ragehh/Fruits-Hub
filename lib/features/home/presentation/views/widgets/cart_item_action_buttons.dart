import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_hub/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';

import '../../../../../core/utils/app_text_styles.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionButton(
          icon: IconButton(
            onPressed: () {
              cartItemEntity.increaseQuantity();
              context.read<CartItemCubit>().updateCartItem(cartItemEntity);
            },
            icon: Center(child: Icon(Icons.add, color: Colors.white, size: 50)),
          ),
          color: AppColors.primaryColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            cartItemEntity.quantity.toString(),
            textAlign: TextAlign.center,
            style: TextStyles.bold13,
          ),
        ),
        CartItemActionButton(
          icon: IconButton(
            onPressed: () {
              cartItemEntity.decreaseQuantity();
              context.read<CartItemCubit>().updateCartItem(cartItemEntity);
            },
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

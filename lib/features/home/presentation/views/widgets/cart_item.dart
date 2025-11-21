import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/widgets/custom_network_image.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/cart_item_action_buttons.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/app_text_styles.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 73,
            height: 92,
            decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
            child: CustomNetworkImage(
              imageUrl: cartItemEntity.productEntity.imageUrl!,
            ),
          ),
          const SizedBox(width: 17),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      cartItemEntity.productEntity.productName,
                      style: TextStyles.bold13,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(Assets.imagesTrash),
                    ),
                  ],
                ),
                Text(
                  '${cartItemEntity.calculateTotalWeight()} كم',
                  style: TextStyles.regular13.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                Row(
                  children: [
                    CartItemActionButtons(),
                    Spacer(),
                    Text(
                      '${cartItemEntity.calculateTotalPrice()} جنيه ',
                      style: TextStyles.bold16.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'active_shipping_item_dot.dart';
import 'inactive_shipping_item_dot.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.isSelected,
  });

  final String title, subTitle, price;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: const EdgeInsets.only(top: 16, bottom: 16, left: 13, right: 5),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Color(0x33D9D9D9),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2,
            color: isSelected ? AppColors.primaryColor : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isSelected
                ? const ActiveShippingItemDot()
                : const InactiveShippingItemDot(),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyles.semiBold13),
                SizedBox(height: 6),
                Text(
                  subTitle,
                  style: TextStyles.regular13.copyWith(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            Spacer(),
            Center(
              child: Text(
                price,
                style: TextStyles.bold13.copyWith(
                  color: AppColors.lightPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

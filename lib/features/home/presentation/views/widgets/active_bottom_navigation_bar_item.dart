import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/app_text_styles.dart';

class ActiveBottomNavigationBarItem extends StatelessWidget {
  const ActiveBottomNavigationBarItem({
    super.key,
    required this.image,
    required this.text,
  });

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Center(
        child: Container(
          padding: EdgeInsets.only(left: 16),
          decoration: ShapeDecoration(
            color: Color(0xFFEEEEEE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: ShapeDecoration(
                  color: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Center(child: SvgPicture.asset(image)),
              ),
              SizedBox(width: 4),
              Text(
                text,
                style: TextStyles.semiBold11.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

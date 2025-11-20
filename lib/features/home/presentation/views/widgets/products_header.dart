import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/app_text_styles.dart';

class ProductsHeader extends StatelessWidget {
  const ProductsHeader({super.key, required this.productsCount});

  final int productsCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$productsCount نتائج', style: TextStyles.bold16),
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: ShapeDecoration(
            color: Colors.white.withOpacity(0.1),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0x66CACECE)),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: SvgPicture.asset(Assets.imagesFilter2),
        ),
      ],
    );
  }
}

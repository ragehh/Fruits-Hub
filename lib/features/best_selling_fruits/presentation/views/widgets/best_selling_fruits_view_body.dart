import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/best_selling_grid_view.dart';

import '../../../../../core/utils/app_text_styles.dart';

class BestSellingFruitsViewBody extends StatelessWidget {
  const BestSellingFruitsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: const Column(
              children: [
                SizedBox(height: 24),
                Row(
                  children: [Text('الأكثر مبيعًا', style: TextStyles.bold16)],
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
          BestSellingGridView(products: []),
        ],
      ),
    );
  }
}

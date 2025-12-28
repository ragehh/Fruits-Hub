import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/constants.dart';

import '../../../../../core/cubits/products_cubit/products_cubit.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../home/presentation/views/widgets/products_grid_view_bloc_builder.dart';

class BestSellingFruitsViewBody extends StatefulWidget {
  const BestSellingFruitsViewBody({super.key});

  @override
  State<BestSellingFruitsViewBody> createState() =>
      _BestSellingFruitsViewBodyState();
}

class _BestSellingFruitsViewBodyState extends State<BestSellingFruitsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingProducts();
    super.initState();
  }

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
          ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}

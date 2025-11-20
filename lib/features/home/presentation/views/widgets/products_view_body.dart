import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/products_header.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/search_text_field.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/notification_icon_widget.dart';
import 'products_grid_view_bloc_builder.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: kTopPadding),
                buildAppBar(
                  context,
                  title: 'المنتجات',
                  actions: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: NotificationIconWidget(),
                    ),
                  ],
                  showBackButton: false,
                ),
                SizedBox(height: 16),
                SearchTextField(),
                SizedBox(height: 12),
                ProductsHeader(
                  productsCount: context.read<ProductsCubit>().productsCount,
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

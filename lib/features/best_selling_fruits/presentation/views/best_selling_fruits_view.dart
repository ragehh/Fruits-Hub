import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/core/widgets/notification_icon_widget.dart';
import 'package:fruits_hub/features/best_selling_fruits/presentation/views/widgets/best_selling_fruits_view_body.dart';

import '../../../../core/cubits/products_cubit/products_cubit.dart';
import '../../../../core/repos/products_repo/products_repo.dart';
import '../../../../core/services/get_it_service.dart';

class BestSellingFruitsView extends StatelessWidget {
  const BestSellingFruitsView({super.key});

  static const routeName = 'BestSellingFruitsView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: 'الأكثر مبيعًا',
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: NotificationIconWidget(),
            ),
          ],
        ),
        body: BestSellingFruitsViewBody(),
      ),
    );
  }
}

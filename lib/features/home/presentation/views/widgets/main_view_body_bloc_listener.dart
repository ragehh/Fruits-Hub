import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/build_snack_bar.dart';
import 'package:fruits_hub/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';

import 'main_view_body.dart';

class MainViewBodyBlocListener extends StatelessWidget {
  const MainViewBodyBlocListener({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          buildSnackBar(context, 'تمت إضافة المنتج الي السلة بنجاح.');
        }
        if (state is CartItemRemoved) {
          buildSnackBar(context, 'تم حذف المنتج من السلة بنجاح.');
        }
      },
      child: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/build_snack_bar.dart';
import 'package:fruits_hub/core/widgets/custom_modal_progress_hud.dart';
import 'package:fruits_hub/features/checkout/presentation/manager/add_order_cubit/add_order_cubit.dart';

class AddOrderCubitBlocConsumer extends StatelessWidget {
  const AddOrderCubitBlocConsumer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (BuildContext context, state) {
        if (state is AddOrderSuccess) {
          buildSnackBar(context, 'تم العملية بنجاح.');
        }
        if (state is AddOrderFailure) {
          buildSnackBar(context, state.errorMessage);
        }
      },
      builder: (BuildContext context, state) {
        return CustomModalProgressHud(
          inAsyncCall: state is AddOrderLoading,
          child: child,
        );
      },
    );
  }
}

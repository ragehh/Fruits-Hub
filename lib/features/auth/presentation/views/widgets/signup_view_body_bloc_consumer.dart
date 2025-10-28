import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_modal_progress_hud.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/signup_view_body.dart';

import '../../../../../core/helper_functions/build_error_snack_bar.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {}
        if (state is SignupFailure) {
          buildErrorSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomModalProgressHud(
          inAsyncCall: state is SignupLoading ? true : false,
          child: SignupViewBody(),
        );
      },
    );
  }
}

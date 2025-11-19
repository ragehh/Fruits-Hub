import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_modal_progress_hud.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:fruits_hub/features/home/presentation/views/main_view.dart';

import '../../../../../core/helper_functions/build_error_snack_bar.dart';
import '../../cubits/sign_in_cubit/sign_in_cubit.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          Navigator.pushNamed(context, MainView.routeName);
        }
        if (state is SignInFailure) {
          buildErrorSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomModalProgressHud(
          inAsyncCall: state is SignInLoading ? true : false,
          child: SignInViewBody(),
        );
      },
    );
  }
}

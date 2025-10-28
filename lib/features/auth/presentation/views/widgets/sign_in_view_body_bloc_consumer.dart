import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_modal_progress_hud.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/sign_in_view_body.dart';

import '../../cubits/sign_in_cubit/sign_in_cubit.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomModalProgressHud(
          inAsyncCall: state is SignInLoading ? true : false,
          child: SignInViewBody(),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/sign_in_view_body.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../cubits/signup_cubit/signup_cubit.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const routeName = 'SignInView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'تسجيل دخول'),
        body: SignInViewBody(),
      ),
    );
  }
}

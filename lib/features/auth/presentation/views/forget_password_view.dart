import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/forget_password_view_body_bloc_consumer.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  static const routeName = 'ForgetPasswordView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'نسيان كلمة المرور'),
        body: ForgetPasswordViewBodyBlocListener(),
      ),
    );
  }
}

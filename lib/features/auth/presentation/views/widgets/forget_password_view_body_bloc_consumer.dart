import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper_functions/build_show_dialog.dart';
import '../../../../../core/helper_functions/build_snack_bar.dart';
import '../../cubits/forget_password_cubit/forget_password_cubit.dart';
import 'forget_password_view_body.dart';

class ForgetPasswordViewBodyBlocListener extends StatelessWidget {
  const ForgetPasswordViewBodyBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          buildShowDialog(
            context,
            'إذا كان هناك حساب مرتبط بهذا البريد الإلكتروني، فسوف تتلقى رابط إعادة تعيين كلمة المرور قريبًا.',
          );
        }
        if (state is ForgetPasswordFailure) {
          buildSnackBar(context, state.errorMessage);
        }
      },
      child: ForgetPasswordViewBody(),
    );
  }
}

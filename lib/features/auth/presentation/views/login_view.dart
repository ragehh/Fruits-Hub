import 'package:flutter/material.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/login_view_body.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = 'LoginView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'تسجيل دخول'),
      body: LoginViewBody(),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = 'LoginView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(context, title: 'تسجيل دخول'));
  }
}

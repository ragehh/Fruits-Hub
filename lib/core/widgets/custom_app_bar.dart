import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

AppBar buildAppBar(
  BuildContext context, {
  required String title,
  List<Widget>? actions,
  bool showBackButton = true,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: actions,
    leading: Visibility(
      visible: showBackButton,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios_new),
      ),
    ),
    centerTitle: true,
    title: Text(title, style: TextStyles.bold19),
  );
}

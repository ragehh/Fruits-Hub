import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

AppBar buildAppBar(BuildContext context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back_ios_new),
    ),
    centerTitle: true,
    title: Text(title, style: TextStyles.bold19),
  );
}

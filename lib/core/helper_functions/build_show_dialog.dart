import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/sign_in_view.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

Future<dynamic> buildShowDialog(BuildContext context, String message) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  SignInView.routeName,
                  (route) => false,
                );
              },
              child: Icon(Icons.close, size: 20),
            ),
            const Center(
              child: Icon(
                Icons.check_circle,
                size: 100,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 30),
            Center(child: Text(message, style: TextStyles.bold16)),
          ],
        ),
      );
    },
  );
}

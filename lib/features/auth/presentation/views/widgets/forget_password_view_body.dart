import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';

import '../../../../../core/utils/app_text_styles.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Text(
            'لا تقلق ، ما عليك سوى كتابة رقم هاتفك وسنرسل إليك رمز التحقق.',
            style: TextStyles.semiBold16.copyWith(color: Color(0xFF616A6B)),
          ),
          const SizedBox(height: 30),
          const CustomTextFormField(
            hintText: 'رقم الهاتف',
            textInputType: TextInputType.phone,
          ),
          const SizedBox(height: 30),
          CustomButton(onPressed: () {}, text: 'نسيت كلمة المرور'),
        ],
      ),
    );
  }
}

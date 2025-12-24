import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';

import '../../../../../core/utils/app_text_styles.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          children: [
            const SizedBox(height: 24),
            Text(
              'لا تقلق ، ما عليك سوى كتابة البريد الإلكتروني الخاص بحسابك وسنرسل إليك رابط لإعادة تعيين كلمة المرور.',
              style: TextStyles.semiBold16.copyWith(color: Color(0xFF616A6B)),
            ),
            const SizedBox(height: 30),
            CustomTextFormField(
              onSaved: (value) {
                email = value!;
              },
              hintText: 'البريد الإلكتروني',
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 30),
            CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  context.read<ForgetPasswordCubit>().sendPasswordResetEmail(
                    email,
                  );
                } else {
                  autoValidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              text: 'إعادة تعيين كلمة المرور',
            ),
          ],
        ),
      ),
    );
  }
}

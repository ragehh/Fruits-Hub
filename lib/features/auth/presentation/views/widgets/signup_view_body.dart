import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/helper_functions/build_error_snack_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/have_an_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/terms_and_conditions_widget.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/password_field.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String name, email, password;
  late bool isTermsAndConditionsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                hintText: 'الاسم كامل',
                textInputType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 16),
              TermsAndConditionsWidget(
                onChanged: (bool value) {
                  isTermsAndConditionsAccepted = value;
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsAndConditionsAccepted) {
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            name,
                            email,
                            password,
                          );
                    } else {
                      buildErrorSnackBar(
                        context,
                        'يجب عليك الموافقة علي الشروط والأحكام.',
                      );
                    }
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: 'إنشاء حساب جديد',
              ),
              const SizedBox(height: 26),
              const HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

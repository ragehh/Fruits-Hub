import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'الاسم كامل',
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 8),
          CustomTextFormField(
            hintText: 'رقم الهاتف',
            textInputType: TextInputType.number,
          ),
          SizedBox(height: 8),
          CustomTextFormField(
            hintText: 'البريد الإلكتروني',
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 8),
          CustomTextFormField(
            hintText: 'العنوان',
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 8),
          CustomTextFormField(
            hintText: 'المدينة',
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 8),
          CustomTextFormField(
            hintText: 'رقم الطابق , رقم الشقة ..',
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

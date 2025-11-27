import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({
    super.key,
    required this.formKey,
    required this.valueListenable,
  });

  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: valueListenable,
        builder: (context, value, child) => Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            children: [
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity.name =
                      value;
                },
                hintText: 'الاسم كامل',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 8),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity.phone =
                      value;
                },
                hintText: 'رقم الهاتف',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 8),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity.email =
                      value;
                },
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 8),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity.address =
                      value;
                },
                hintText: 'العنوان',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 8),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity.city =
                      value;
                },
                hintText: 'المدينة',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 8),
              CustomTextFormField(
                onSaved: (value) {
                  context
                          .read<OrderEntity>()
                          .shippingAddressEntity
                          .addressDetails =
                      value;
                },
                hintText: 'رقم الطابق , رقم الشقة ..',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

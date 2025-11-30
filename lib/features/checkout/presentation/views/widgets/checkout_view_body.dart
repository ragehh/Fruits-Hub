import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/helper_functions/build_snack_bar.dart';
import 'package:fruits_hub/core/utils/app_keys.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/checkout/domain/entities/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_steps.dart';

import '../../../domain/entities/order_entity.dart';
import 'checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  late var orderEntity = context.read<OrderEntity>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          SizedBox(height: kTopPadding),
          CheckoutSteps(
            currentPageIndex: currentPageIndex,
            pageController: pageController,
          ),
          SizedBox(height: 32),
          Expanded(
            child: CheckoutStepsPageView(
              pageController: pageController,
              formKey: formKey,
              valueListenable: valueNotifier,
            ),
          ),
          CustomButton(
            onPressed: () {
              if (currentPageIndex == 0) {
                _handleShippingSectionValidation(context);
              } else if (currentPageIndex == 1) {
                _handleAddressInputSectionValidation(context);
              } else {
                // context.read<AddOrderCubit>().addOrder(order: orderEntity);
                _processPayment(context);
              }
            },
            text: getNextButtonText(currentPageIndex),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  void _handleShippingSectionValidation(BuildContext context) {
    if (orderEntity.payWithCash != null) {
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      buildSnackBar(context, 'يرجي تحديد طريقة الدفع.');
    }
  }

  void _handleAddressInputSectionValidation(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  String getNextButtonText(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'الدفع عبر PayPal';
      default:
        return 'التالي';
    }
  }

  void _processPayment(BuildContext context) {
    PaypalPaymentEntity paypalPaymentEntity = PaypalPaymentEntity.fromEntity(
      orderEntity,
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: kPayPalClientId,
          secretKey: kPayPalSecretKey,
          transactions: [paypalPaymentEntity.toJson()],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            Navigator.pop(context);
            buildSnackBar(context, 'تمت عملية الدفع بنجاح.');
          },
          onError: (error) {
            log(error.toString());
            Navigator.pop(context);
            buildSnackBar(context, 'حدث خطأ في عملية الدفع.');
          },
          onCancel: () {
            print('cancelled:');
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/helper_functions/build_snack_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
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
            child: CheckoutStepsPageView(pageController: pageController),
          ),
          CustomButton(
            onPressed: () {
              if (orderEntity.payWithCash != null) {
                pageController.animateToPage(
                  currentPageIndex + 1,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              } else {
                buildSnackBar(context, 'يرجي تحديد طريقة الدفع.');
              }
            },
            text: getNextButtonText(currentPageIndex),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
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
}

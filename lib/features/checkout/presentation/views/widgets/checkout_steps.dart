import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/build_snack_bar.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_step_item.dart';

import '../../../../../core/helper_functions/get_steps.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({
    super.key,
    required this.currentPageIndex,
    required this.pageController,
  });

  final int currentPageIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              if (context.read<OrderEntity>().payWithCash != null) {
                pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              } else {
                buildSnackBar(context, 'يرجي تحديد طريقة الدفع.');
              }
            },
            child: CheckoutStepItem(
              isActive: index <= currentPageIndex,
              text: getSteps()[index],
              index: (index + 1).toString(),
            ),
          ),
        );
      }),
    );
  }
}

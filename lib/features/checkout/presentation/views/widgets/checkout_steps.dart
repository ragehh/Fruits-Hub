import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_step_item.dart';

import '../../../../../core/helper_functions/get_steps.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({
    super.key,
    required this.currentPageIndex,
    required this.pageController,
    required this.onTap,
  });

  final int currentPageIndex;
  final PageController pageController;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              onTap(index);
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

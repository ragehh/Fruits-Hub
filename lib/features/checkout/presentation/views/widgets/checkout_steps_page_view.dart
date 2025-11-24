import 'package:flutter/material.dart';

import '../../../../../core/helper_functions/get_steps.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: NeverScrollableScrollPhysics(),
      controller: pageController,
      itemCount: getSteps().length,
      itemBuilder: (context, index) {
        return const SizedBox();
      },
    );
  }
}

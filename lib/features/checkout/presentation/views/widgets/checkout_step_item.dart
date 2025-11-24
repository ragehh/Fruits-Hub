import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/active_checkout_step_item.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/inactive_checkout_step_item.dart';

class CheckoutStepItem extends StatelessWidget {
  const CheckoutStepItem({
    super.key,
    required this.text,
    required this.index,
    required this.isActive,
  });

  final String text, index;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: InactiveCheckoutStepItem(text: text, index: index),
      secondChild: ActiveCheckoutStepItem(text: text),
      crossFadeState: isActive
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      duration: Duration(milliseconds: 300),
    );
  }
}

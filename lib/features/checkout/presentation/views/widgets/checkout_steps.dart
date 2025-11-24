import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/checkout_step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
          child: CheckoutStepItem(
            isActive: true,
            text: getSteps()[index],
            index: (index + 1).toString(),
          ),
        );
      }),
    );
  }
}

List<String> getSteps() {
  return ['الشحن', 'العنوان', 'الدفع', 'المراجعة'];
}

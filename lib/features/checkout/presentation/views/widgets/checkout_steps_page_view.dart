import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/address_input_section.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/payment_section.dart';
import 'package:fruits_hub/features/checkout/presentation/views/widgets/shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: NeverScrollableScrollPhysics(),
      controller: pageController,
      itemCount: getStepsPages().length,
      itemBuilder: (context, index) {
        return getStepsPages()[index];
      },
    );
  }

  List<Widget> getStepsPages() {
    return [
      ShippingSection(),
      AddressInputSection(),
      PaymentSection(pageController: pageController),
    ];
  }
}

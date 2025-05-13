import 'package:flutter/material.dart';
import 'package:pay_platform_interface/core/payment_configuration.dart';


class PaymentButton extends StatelessWidget {
  final VoidCallback onPressed;
  final PayProvider provider;

  const PaymentButton({
    super.key,
    required this.onPressed,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(provider == PayProvider.google_pay ? 'Pay with Google Pay' : 'Pay with Apple Pay'),
    );
  }
}
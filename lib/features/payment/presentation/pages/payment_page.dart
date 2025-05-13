import 'package:flutter/material.dart';
import 'package:pay_platform_interface/core/payment_configuration.dart';
import 'package:payment_app/core/di/injection_container.dart';
import 'package:payment_app/features/payment/domain/entities/payment_request.dart';
import 'package:payment_app/features/payment/domain/usecases/process_payment.dart';
import 'package:payment_app/features/payment/presentation/widgets/payment_button.dart';


class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;
  String? errorMessage;
  String? successMessage;

  final ProcessPayment processPayment = sl<ProcessPayment>();

  Future<void> _onPayPressed(PayProvider provider) async {
    setState(() {
      isLoading = true;
      errorMessage = null;
      successMessage = null;
    });

    final paymentRequest = PaymentRequest(
      label: 'Total',
      amount: 99.99,
      currencyCode: 'USD',
    );

    final result = await processPayment(paymentRequest);

    setState(() {
      isLoading = false;
      result.fold(
        (failure) => errorMessage = failure.message,
        (data) => successMessage = 'Payment successful: $data',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading) const CircularProgressIndicator(),
            if (errorMessage != null)
              Text(errorMessage!, style: const TextStyle(color: Colors.red)),
            if (successMessage != null)
              Text(successMessage!, style: const TextStyle(color: Colors.green)),
            const SizedBox(height: 20),
            PaymentButton(
              onPressed: () => _onPayPressed(PayProvider.google_pay),
              provider: PayProvider.google_pay,
            ),
            const SizedBox(height: 10),
            PaymentButton(
              onPressed: () => _onPayPressed(PayProvider.apple_pay),
              provider: PayProvider.apple_pay,
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:payment_app/features/payment/presentation/pages/payment_page.dart';

class PaymentApp extends StatelessWidget {
  const PaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PaymentPage(),
    );
  }
}
import 'package:pay/pay.dart';
import 'package:payment_app/features/payment/data/models/payment_request_model.dart';

abstract class PaymentDataSource {
  Future<Map<String, dynamic>> processPayment(PaymentRequestModel request, PayProvider provider);
}

class PaymentDataSourceImpl implements PaymentDataSource {
  final Pay payClient;

  PaymentDataSourceImpl(this.payClient);

  @override
  Future<Map<String, dynamic>> processPayment(PaymentRequestModel request, PayProvider provider) async {
    try {
      final paymentItems = [request.toPaymentItem()];
      final result = await payClient.showPaymentSelector(
        provider,
        paymentItems,
      );
      return result;
    } catch (e) {
      throw Exception('Failed to process payment: $e');
    }
  }
}

import 'package:pay_platform_interface/core/payment_item.dart';
import 'package:payment_app/features/payment/domain/entities/payment_request.dart';

class PaymentRequestModel extends PaymentRequest {
  PaymentRequestModel({
    required super.label,
    required super.amount,
    required super.currencyCode,
  });

  PaymentItem toPaymentItem() {
    return PaymentItem(
      label: label,
      amount: amount.toString(),
      status: PaymentItemStatus.final_price,
    );
  }
}
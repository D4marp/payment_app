import 'package:dartz/dartz.dart';
import 'package:pay_platform_interface/core/payment_configuration.dart';
import 'package:payment_app/core/utils/failure.dart';
import 'package:payment_app/features/payment/data/datasources/payment_datasource.dart';
import 'package:payment_app/features/payment/data/models/payment_request_model.dart';
import 'package:payment_app/features/payment/domain/entities/payment_request.dart';
import 'package:payment_app/features/payment/domain/repositories/payment_repository.dart';


class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentDataSource dataSource;

  PaymentRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, Map<String, dynamic>>> processPayment(PaymentRequest request) async {
    try {
      final paymentRequestModel = PaymentRequestModel(
        label: request.label,
        amount: request.amount,
        currencyCode: request.currencyCode,
      );
      final result = await dataSource.processPayment(
        paymentRequestModel,
        PayProvider.google_pay, // Ganti dengan apple_pay untuk iOS
      );
      return Right(result);
    } catch (e) {
      return Left(Failure('Payment failed: $e'));
    }
  }
}
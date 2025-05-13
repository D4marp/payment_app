import 'package:dartz/dartz.dart';
import 'package:payment_app/core/utils/failure.dart';
import 'package:payment_app/features/payment/domain/entities/payment_request.dart';

abstract class PaymentRepository {
  Future<Either<Failure, Map<String, dynamic>>> processPayment(
      PaymentRequest request);
}
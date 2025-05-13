import 'package:dartz/dartz.dart';
import 'package:payment_app/core/utils/failure.dart';
import 'package:payment_app/features/payment/domain/entities/payment_request.dart';
import 'package:payment_app/features/payment/domain/repositories/payment_repository.dart';

class ProcessPayment {
  final PaymentRepository repository;

  ProcessPayment(this.repository);

  Future<Either<Failure, Map<String, dynamic>>> call(PaymentRequest request) async {
    return await repository.processPayment(request);
  }
}
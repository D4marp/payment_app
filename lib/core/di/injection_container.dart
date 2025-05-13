import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:get_it/get_it.dart';
import 'package:pay/pay.dart';
import 'package:payment_app/core/constants/app_constants.dart';
import 'package:payment_app/features/payment/data/datasources/payment_datasource.dart';
import 'package:payment_app/features/payment/data/repositories/payment_repository_impl.dart';
import 'package:payment_app/features/payment/domain/repositories/payment_repository.dart';
import 'package:payment_app/features/payment/domain/usecases/process_payment.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Use Cases
  sl.registerLazySingleton(() => ProcessPayment(sl()));

  // Repository
  sl.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoryImpl(sl()),
  );

  // Data Sources
  sl.registerLazySingleton<PaymentDataSource>(
    () => PaymentDataSourceImpl(sl()),
  );

  // External: Initialize Pay with JSON configurations from assets
  // Load JSON strings from assets using rootBundle
  final googlePayConfigString = await rootBundle.loadString(AppConstants.googlePlayConfigPath);
  final applePayConfigString = await rootBundle.loadString(AppConstants.applePayConfigPath);

  // Create PaymentConfiguration objects
  final googlePayConfig = PaymentConfiguration.fromJsonString(googlePayConfigString);
  final applePayConfig = PaymentConfiguration.fromJsonString(applePayConfigString);

  // Initialize Pay client
  final payClient = Pay({
    PayProvider.google_pay: googlePayConfig,
    PayProvider.apple_pay: applePayConfig,
  });

  // Register Pay client
  sl.registerLazySingleton(() => payClient);

  // Ensure Pay client is ready (workaround for event channel initialization)
  try {
    await payClient.userCanPay(Platform.isAndroid ? PayProvider.google_pay : PayProvider.apple_pay);
  } catch (e) {
    // Log error but continue; userCanPay will be checked again in PaymentPage
    print('Initial Pay client check failed: $e');
  }
}
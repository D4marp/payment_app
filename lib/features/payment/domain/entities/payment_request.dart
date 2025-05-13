class PaymentRequest {
   final  String label;
   final double amount;
   final String currencyCode;

   PaymentRequest({
     required this.label,
     required this.amount,
     required this.currencyCode,
   });
}
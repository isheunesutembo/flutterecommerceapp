import 'package:freezed_annotation/freezed_annotation.dart';
part 'payment.freezed.dart';
part 'payment.g.dart';
@freezed
abstract class Payment with _$Payment{
  factory Payment({
   required String transactionId,
   required double amount,
   required String userId,
   required DateTime date,
   required String status
  })=_Payment;
factory Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);
}
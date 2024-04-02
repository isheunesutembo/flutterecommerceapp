

import 'package:ephamarcy/models/payment.dart';
import 'package:ephamarcy/services/paymentservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final paymentControllerProvider=StateNotifierProvider<PaymentController,bool>((ref) => PaymentController(paymentService: ref.watch(paymentServiceProvider), ref: ref));
class PaymentController extends StateNotifier<bool>{
  final PaymentService _paymentService;
  final Ref _ref;
  PaymentController({required PaymentService paymentService,required Ref ref}):
  _paymentService=paymentService,_ref=ref,super(false);

  Future< void >createPayment(
      BuildContext context,
      String transactionId,
      double amount,
      String userId,
      String status
      ) async {
    
    
    
    final payment = Payment(
     transactionId: transactionId,
     amount: amount,
     userId: userId,
     date: DateTime.now(),
     status: status);
    final res = _paymentService.createPayment(payment);
    state = false;
    

    res.fold(
        (l) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l.message))),
        (r) => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Order has been placed successfully"))));
            
  }
}
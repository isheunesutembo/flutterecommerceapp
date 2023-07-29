import 'package:ephamarcy/controllers/cartcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PayPalCheckOutPage extends ConsumerWidget {
  const PayPalCheckOutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartControllerProvider.notifier);
    return Scaffold(
      
       
        body: PaypalCheckout(
            onSuccess: (Map params) async {},
            onError: (error) {},
            onCancel: (params) {},
            returnURL: "https://samplesite.com/return",
            cancelURL: "https://samplesite.com/cancel",
            transactions: [
              {
                "amount": {
                  "total": '${cart.productTotal}',
                  "currency": 'USD',
                  "details": {"subtotal": '${cart.productTotal}'},
                },
                "itemsList": {
                  "items": [{}]
                }
              },
            ],
            sandboxMode: true,
            clientId:
                'AeVXZXifknzHm1fNqQOKUYRGHfBzlryD5PtZuP_gmqlm2cpWCSF0lQz1q3KksP4ZGoD_7AQfEWgrWBin',
            secretKey:
                'EKJx7F0G9a0wX3syNPIx9kB4B8sfqBRw7Ak7czCmmkgmnWsmGwjN7-HsUrVuH-KAhTTuTXB_udAc5yNe'));
  }
}

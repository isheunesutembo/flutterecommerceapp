import 'dart:convert';
import 'package:ephamarcy/pages/paypalcheckoutpage.dart';
import 'package:ephamarcy/services/yoomoneypaymentservice.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:ephamarcy/apikeys/apikey.dart';
import 'package:ephamarcy/controllers/cartcontroller.dart';
import 'package:ephamarcy/services/stripepaymentservice.dart';
import 'package:ephamarcy/widgets/addresscard.dart';
import 'package:ephamarcy/widgets/carttotal.dart';
import 'package:ephamarcy/widgets/checkoutproducts.dart';
import 'package:ephamarcy/widgets/customerinfortioncheckout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

class CheckOutPage extends ConsumerWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, dynamic>? paymentIntent;
    final cart = ref.watch(cartControllerProvider.notifier);
    StripePaymentService paymentService = StripePaymentService();
    YooMoneyPaymentService yooMoneyPaymentService = YooMoneyPaymentService();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Checkout"),
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            const AddressCard(),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Order Summary",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const CheckoutProducts(),
            const CartTotal(),
            SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                    onPressed: () async {
                   paymentService.makePayment(context,double.parse( cart.productTotal));
                    },
                    child: const Text(
                      "Order",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )))
          ],
        )),
      ),
    );
  }
}

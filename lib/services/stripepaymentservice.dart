import 'dart:convert';
import 'package:ephamarcy/controllers/paymentcontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:ephamarcy/apikeys/apikey.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
final stripeServiceProvider=Provider((ref)=>StripePaymentService(ref: ref));
class StripePaymentService {
 final Ref _ref;
 StripePaymentService({required Ref ref}):_ref=ref;
  
  Map<String, dynamic>? paymentIntent;
  Future<void> makePayment(BuildContext context, double amount) async {
    try {
      //STEP 1: Create Payment Intent
      paymentIntent = await createPaymentIntent(amount.toString(), 'USD',context);

      
     
       
   
      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
            
              paymentSheetParameters: SetupPaymentSheetParameters(
                  customFlow: false,
                  paymentIntentClientSecret: paymentIntent!['client_secret'], 
                  customerEphemeralKeySecret: paymentIntent!['ephemeralKey'],//Gotten from payment intent
                  style: ThemeMode.system,
                  merchantDisplayName: 'Ishe',
                  customerId:paymentIntent!['customer'] ,
                  applePay:const PaymentSheetApplePay(merchantCountryCode: 'US',),
                  googlePay:const PaymentSheetGooglePay(merchantCountryCode: "US",testEnv: true),
                  allowsDelayedPaymentMethods: true,
                  
                   ));

      //STEP 3: Display Payment sheet
     displayPaymentSheet(context);
     final currentUser = FirebaseAuth.instance.currentUser;
              _ref.watch(paymentControllerProvider.notifier)
             .createPayment(context, paymentIntent!['id'],amount, currentUser!.uid,paymentIntent!["status"]);
         
    } catch (err) {
      throw Exception(err);
    }
  }

  createPaymentIntent(String amount, String currency,BuildContext context) async {
    
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency
      };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${APIKey.STRIPE_SECRET}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      if (response.statusCode == 200) {
          Map<String, dynamic>? paymentIntent=json.decode(response.body);
             
            
           
          
       
      

      
       
      return json.decode(response.body);
        
      }
      
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  displayPaymentSheet(BuildContext context) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        Stripe.instance.presentPaymentSheet();
      
      }).onError((error, stackTrace) {
        throw Exception(error);
      });
    } on StripeException catch (error) {
      
      const AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                Text("Payment Failed"),
              ],
            ),
          ],
        ),
      );
    } catch (e) {
      print('$e');
    }
  }

  calculateAmount(String amount) {
    final calculatedAmout = (double.parse(amount) * 100).toInt();
    return calculatedAmout.toString();
  }
}

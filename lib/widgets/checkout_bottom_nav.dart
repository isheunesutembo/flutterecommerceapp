import 'package:ephamarcy/common.dart/error.dart';
import 'package:ephamarcy/controllers/authcontroller.dart';
import 'package:ephamarcy/models/user.dart';
import 'package:ephamarcy/services/stripepaymentservice.dart';
import 'package:ephamarcy/widgets/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckOutBottomNav extends ConsumerWidget {
  const CheckOutBottomNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StripePaymentService stripePaymentService = StripePaymentService();
    final currentUser = FirebaseAuth.instance.currentUser;
    final userProvider = ref.watch(getUserDataProvider(currentUser!.uid));
    return userProvider.when(
        data: (data) {
          return data.cart!=null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      stripePaymentService.makePayment(
                          context, data.grandTotal);
                         // data.cart!.clear();
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total:\$${data.grandTotal.toString()}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            const Text(
                              "Proceed To CheckOut",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox();
        },
        error: (error, stackTrace) => ErrorText(error: error.toString()),
        loading: () => Loader());
  }
}

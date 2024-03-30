
import 'package:ephamarcy/controllers/authcontroller.dart';
import 'package:ephamarcy/controllers/cartcontroller.dart';
import 'package:ephamarcy/views/home.dart';
import 'package:ephamarcy/widgets/cart_item_widget.dart';
import 'package:ephamarcy/widgets/checkout_bottom_nav.dart';
import 'package:ephamarcy/widgets/errortext.dart';
import 'package:ephamarcy/widgets/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final userProvider = ref.watch(getUserDataProvider(currentUser!.uid));
    final cart = ref.watch(cartControllerProvider.notifier);
    return Scaffold(
      bottomNavigationBar: const CheckOutBottomNav(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
              onTap: () {
                cart.clearCart();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Clear Cart",
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ))
        ],
        title: const Center(
          child: Text(
            "Cart",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: userProvider.when(
          data: (data) {
            return data.cart != null
                ? ListView(
                    children: [
                      Column(
                          children: data.cart!
                              .map((cartItem) => CartItemWidget(item: cartItem))
                              .toList()),
                    ],
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      const  Center(child: Text("Cart Is Empty")),
                      const  SizedBox(
                          height: 8,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            },
                            child:const Center(
                              child: Text(
                                "Back To Shopping",
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ))
                      ],
                    ),
                  );
          },
          error: (error, stackTrace) => ErrorText(error: error.toString()),
          loading: () => const Loader()),
    );
  }
}

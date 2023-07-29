import 'package:ephamarcy/pages/checkoutpage.dart';
import 'package:ephamarcy/widgets/cartproduct.dart';
import 'package:ephamarcy/widgets/carttotal.dart';

import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Center(
            child: Text(
          "Your Cart",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const CartProducts(),
          const CartTotal(),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: 400,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckOutPage()));
                    }, child: const Text("CheckOut"))),
          )
        ]),
      ),
    );
  }
}

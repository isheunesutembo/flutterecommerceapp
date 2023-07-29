import 'package:ephamarcy/controllers/cartcontroller.dart';
import 'package:ephamarcy/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dash/flutter_dash.dart';

class CheckoutProducts extends ConsumerWidget {
  const CheckoutProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartController = ref.watch(cartControllerProvider.notifier);

    return SizedBox(
      height: 350,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: cartController.products.length,
          itemBuilder: (BuildContext context, int index) {
            return CheckoutProductCard(
                cartController: cartController,
                product: cartController.products.keys.toList()[index],
                quantity: cartController.products.values.toList()[index],
                index: index);
          }),
    );
  }
}

class CheckoutProductCard extends ConsumerWidget {
  final CartController cartController;
  final Product product;
  final int quantity;
  final int index;
  const CheckoutProductCard(
      {required this.cartController,
      required this.product,
      required this.quantity,
      required this.index,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            product.name!,
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
          ),
          const Dash(
            direction: Axis.horizontal,
            length: 70,
            dashColor: Colors.black,
          ),
          Text(
            "${quantity}",
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

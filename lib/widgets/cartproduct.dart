import 'package:ephamarcy/controllers/cartcontroller.dart';
import 'package:ephamarcy/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartProducts extends ConsumerWidget {
  const CartProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartController = ref.watch(cartControllerProvider.notifier);

    return SizedBox(
      height: 600,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: cartController.products.length,
          separatorBuilder: (context, index) => const Column(children: [
                Divider(
                  height: 8,
                )
              ]),
          itemBuilder: (BuildContext context, int index) {
            return CartProductCard(
                cartController: cartController,
                product: cartController.products.keys.toList()[index],
                quantity: cartController.quantity[index],
                index: index);
          }),
    );
  }
}

class CartProductCard extends ConsumerWidget {
  final CartController cartController;
  final Product product;
  final int quantity;
  final int index;
  const CartProductCard(
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
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(product.image!),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(child: Text(product.name!)),
          IconButton(
              onPressed: () {
                ref
                    .watch(cartControllerProvider.notifier)
                    .removeProduct(product);
              },
              icon: const Icon(
                Icons.remove_circle,
                color: Colors.blue,
              )),
          Text("${quantity}"),
          IconButton(
              onPressed: () {
                ref.watch(cartControllerProvider.notifier).addproduct(product);
              },
              icon: const Icon(
                Icons.add_circle,
                color: Colors.blue,
              ))
        ],
      ),
    );
  }
}

import 'package:ephamarcy/controllers/cartcontroller.dart';
import 'package:ephamarcy/models/cartitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartItemWidget extends ConsumerWidget {
  CartItem item;
  CartItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartController = ref.watch(cartControllerProvider.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            item.image,
            width: 80,
          ),
        ),
        Expanded(
            child: Wrap(
          direction: Axis.vertical,
          children: [
            Container(
                padding:const EdgeInsets.only(left: 14),
                child: Text(
                  item.name,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      cartController.decreaseQuantity(item);
                    }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.quantity.toString(),
                  ),
                ),
                IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      cartController.increaseQuantity(item);
                    }),
              ],
            )
          ],
        )),
        IconButton(
            onPressed: () {
              cartController.removeCartItem(item, context);
            },
            icon: const Icon(Icons.delete,color: Colors.red,)),
        Padding(
          padding: const EdgeInsets.all(14),
          child: Text(
            "\$${item.cost}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:Colors.blue),
          ),
        ),
       const Divider(thickness: 2,color: Colors.orange,)
      ],
    );
  }
}

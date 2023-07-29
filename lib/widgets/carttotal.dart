import 'package:ephamarcy/controllers/cartcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartTotal extends ConsumerWidget {
  const CartTotal({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final cartController=ref.watch(cartControllerProvider.notifier);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:cartController.productTotal!=0? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
       const     Text("Total",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            Text("\$${cartController.productTotal}",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
          ],):
         const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            Text("Total",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            Text("0",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
          ],),
      ),
    );
  }
}
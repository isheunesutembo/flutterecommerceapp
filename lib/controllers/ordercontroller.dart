
import 'package:ephamarcy/models/address.dart';
import 'package:ephamarcy/models/order.dart';
import 'package:ephamarcy/models/user.dart';
import 'package:ephamarcy/services/orderservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
final orderControllerProvider=StateNotifierProvider<OrderController,bool>((ref)=>OrderController(ref: ref, orderService:ref.watch(ordersServiceProvider )));
final getUserOrders=StreamProvider.family((ref,String userId){
  final orders=ref.watch(orderControllerProvider.notifier)
  .getUserOrders(userId);
  return orders;
});
class OrderController extends StateNotifier<bool> {
  final Ref _ref;
  final OrderService _orderService;
  OrderController({required Ref ref, required OrderService orderService})
      : _ref = ref,
        _orderService = orderService,
        super(false);
      
 Future< void >createOrder(
      BuildContext context,
      String uid,
      UserModel user,
      AddressModel address,
      double total) async {
    
    String orderId = const Uuid().v1();
    
    final order = Orders(
        uid: uid,
        products: user.cart!.toList(),
        total: total,
        orderId: orderId,
        address: address,
        date: DateTime.now(),
        isAccepted: false,
        isCancelled: false,
        isDelivered: false);
    final res = _orderService.createOrder(order);
    state = false;
    

    res.fold(
        (l) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l.message))),
        (r) => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Order has been placed successfully"))));
            
  }

  Stream<List<Orders>>getUserOrders(String userId){
    return _orderService.getUserOrders(userId);
  }
}

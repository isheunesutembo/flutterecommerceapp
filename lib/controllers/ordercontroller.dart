import 'package:ephamarcy/controllers/authcontroller.dart';
import 'package:ephamarcy/core/orderenum.dart';
import 'package:ephamarcy/models/address.dart';
import 'package:ephamarcy/models/cartitem.dart';
import 'package:ephamarcy/models/order.dart';
import 'package:ephamarcy/services/orderservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
final orderControllerProvider=StateNotifierProvider<OrderController,bool>((ref)=>OrderController(ref: ref, orderService:ref.watch(ordersServiceProvider )));
class OrderController extends StateNotifier<bool> {
  final Ref _ref;
  final OrderService _orderService;
  OrderController({required Ref ref, required OrderService orderService})
      : _ref = ref,
        _orderService = orderService,
        super(false);
      
  void createOrder(
      BuildContext context,
      String uid,
      List<CartItem> products,
      AddressModel address,
      double total) {
    
    String orderId = const Uuid().v1();
   final userData=_ref.read(getUserDataFromFirestoreProvider).whenData((value) =>_orderService.createOrder(Orders(products:value.cart!, total: total, orderId: orderId, address: address, orderStatus: OrderStatus.pending, date: DateTime.now())));
    /*final order = Orders(
      uid: uid,
        products: products,
        total: total,
        orderId: orderId,
        address: address,
        date: DateTime.now(),
        orderStatus: OrderStatus.pending);
    final res = _orderService.createOrder(order);
    state = false;
    */

    /*res.fold(
        (l) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l.message))),
        (r) => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Order has been placed successfully"))));
            */
  }
}

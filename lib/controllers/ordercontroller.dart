import 'package:ephamarcy/models/address.dart';
import 'package:ephamarcy/models/cartitem.dart';
import 'package:ephamarcy/models/order.dart';
import 'package:ephamarcy/services/orderdervice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class OrderController extends StateNotifier<bool> {
  final Ref _ref;
  final OrderService _orderService;
  OrderController({required Ref ref, required OrderService orderService})
      : _ref = ref,
        _orderService = orderService,
        super(false);
  void createOrder(
      BuildContext context,
      AddressModel address,
      List<CartItem> products,
      double total,
      String orderStatus,
      DateTime date) {
    String orderId = const Uuid().v1();
    final order = Orders(
        address: address,
        products: products,
        total: total,
        orderId: orderId,
        orderStatus: orderStatus,
        date: date);
    final res = _orderService.createOrder(order);
    state = false;

    res.fold(
        (l) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l.message))),
        (r) => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("product uploaded successfully"))));
  }
}

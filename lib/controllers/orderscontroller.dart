

import 'package:ephamarcy/constants/firebase_constants.dart';
import 'package:ephamarcy/models/order.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrdersController extends StateNotifier<bool>{
  OrdersController():super(false);
  List<Order>_orders=[];
  List<Order>get orders=>_orders;
  Future<void>fetchAndSetOrders()async{
    
    _orders.clear();
    FirebaseConstants.orderRef
    .orderBy('id',descending: true)
    .snapshots()
    .listen((documentSnapshot) { 
      _orders.clear();
      documentSnapshot.docs.forEach((order) {
        _orders.add(Order.fromJson(order.data()));
       });
    });

  }
  Future<void>placeOrder(Order order)async{
    await FirebaseConstants.orderRef.doc(order.id)
    .set(order.toJson());
  }
}
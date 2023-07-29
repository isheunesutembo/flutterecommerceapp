import 'package:ephamarcy/core/utils.dart';
import 'package:ephamarcy/models/cart.dart';
import 'package:ephamarcy/models/product.dart';
import 'package:ephamarcy/services/cartservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartControllerProvider=ChangeNotifierProvider((ref)=>
CartController());

class CartController extends ChangeNotifier {
  CartController() : super();
   late Map<dynamic,dynamic> _products={};
  get products => _products;

  get productSubTotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();
  get productTotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
      get quantity=>products.values.toList();
      
  Future<void> addproduct(Product product) async {
    if (_products.containsKey(product)) {
      _products[product] += 1;
      notifyListeners();
      
    } else {
      _products[product] = 1;
      notifyListeners();
    }
  }

  Future<void> removeProduct(Product product) async {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == _products);
      notifyListeners();
    } else {
      _products = _products[product] -= 1;
      notifyListeners();
    }
  }
}

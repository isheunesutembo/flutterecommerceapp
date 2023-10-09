
import 'package:ephamarcy/models/cartitem.dart';
import 'package:ephamarcy/models/product.dart';
import 'package:ephamarcy/services/cartservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartControllerProvider = StateNotifierProvider<CartController, bool>(
    (ref) =>
        CartController(cartService: ref.watch(cartServiceProvider), ref: ref));

class CartController extends StateNotifier<bool> {
  final CartService _cartService;
  final Ref _ref;

  CartController({required CartService cartService, required Ref ref})
      : _cartService = cartService,
        _ref = ref,
        super(false);

  void addProductToCart(Product product, BuildContext context) {
    _cartService.addProductToCart(product,context).fold(
        (l) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l.toString()))) ,
        (r) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${product.name} added to cart"))));
  }

  void removeCartItem(CartItem item,BuildContext context){
    _cartService.removeCartItem(item)
    .fold((l) =>ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l.toString()))) , (r) =>ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${item.name} removed from cart"))));
  }
  void decreaseQuantity(CartItem item){
    _cartService.decreaseQuantity(item);
  }
  void increaseQuantity(CartItem item){
    _cartService.increaseQuantity(item);
  }

  Future<void>clearCart()async{
    return _cartService.clearCart();
  }

}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ephamarcy/constants/firebase_constants.dart';
import 'package:ephamarcy/controllers/authcontroller.dart';
import 'package:ephamarcy/core/failure.dart';
import 'package:ephamarcy/models/cartitem.dart';
import 'package:ephamarcy/models/product.dart';
import 'package:ephamarcy/models/user.dart';
import 'package:ephamarcy/providers/firebaseproviders/firebaseproviders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

final cartServiceProvider = Provider((ref) => CartService(
    firebaseFirestore: ref.watch(firebaseFirestoreProvider),
    firebaseAuth: ref.watch(firebaseAuthProvider),
    firebaseStorage: ref.watch(firebaseStorageProvider),
    ref: ref));

class CartService {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;
  final FirebaseStorage _firebaseStorage;
  final Ref _ref;
  CartService(
      {required FirebaseFirestore firebaseFirestore,
      required FirebaseAuth firebaseAuth,
      required FirebaseStorage firebaseStorage,
      required Ref ref})
      : _firestore = firebaseFirestore,
        _firebaseAuth = firebaseAuth,
        _firebaseStorage = firebaseStorage,
        _ref = ref;

  Either<dynamic, Future<void>> addProductToCart(
      Product product, BuildContext context) {
    String cartId = const Uuid().v1();
    try {
      return right(FirebaseConstants.cartRef.set({
        "cart": FieldValue.arrayUnion([
          CartItem(
                  cartId: cartId,
                  image: product.image.toString(),
                  productId: product.productId.toString(),
                  quantity: 1,
                  cost: product.price!.toDouble(),
                  name: product.name!,
                  price: product.price!)
              .toJson()
        ]),
      }, SetOptions(merge: true)));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  Either<dynamic, Future<void>> removeCartItem(CartItem cartItem) {
    try {
      return right(FirebaseConstants.cartRef.update({
        "cart": FieldValue.arrayRemove([cartItem.toJson()])
      }));
    } catch (e) {
      return left(throw Exception(e));
    }
  }

  void decreaseQuantity(CartItem item) {
    if (item.quantity == 1) {
      removeCartItem(item);
    } else {
      
      item.quantity - 1;
      FirebaseConstants.cartRef.update({
        "cart": FieldValue.arrayRemove([item.toJson()])
      });
    }
  }

  Future<void> clearCart() async {
    FirebaseConstants.cartRef.update({"cart": FieldValue.delete()});
  }

  void increaseQuantity(CartItem item) {
    // removeCartItem(item);
    FirebaseConstants.cartRef.get().then((DocumentSnapshot doc) {
      final dynamic data = doc.data() as Map<String, dynamic>;
      _firestore.runTransaction((transaction) async {
        final snapshot = await transaction.get(FirebaseConstants.cartRef);
        final newQuantity = snapshot.get(data!["cart"]) + 1;
        
      }).then((quantity)=>print("error increasing quantity"),
      onError: (e)=>print("Error updating document $e"));
    });
  }
}

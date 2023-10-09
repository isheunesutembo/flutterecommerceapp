import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ephamarcy/constants/firebase_constants.dart';
import 'package:ephamarcy/models/order.dart';
import 'package:ephamarcy/providers/firebaseproviders/firebaseproviders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final ordersProvider = Provider((ref) => OrderService(
    firestore: ref.watch(firebaseFirestoreProvider),
    firebaseAuth: ref.watch(firebaseAuthProvider),
    firebaseStorage: ref.watch(firebaseStorageProvider)));

class OrderService {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;
  final FirebaseStorage _firebaseStorage;
  OrderService(
      {required FirebaseFirestore firestore,
      required FirebaseAuth firebaseAuth,
      required FirebaseStorage firebaseStorage})
      : _firestore = firestore,
        _firebaseAuth = firebaseAuth,
        _firebaseStorage = firebaseStorage;
  CollectionReference get _orders =>
      _firestore.collection(FirebaseConstants.orderCollection);
  Either<dynamic, Future<void>> createOrder(Orders order) {
    return right(_orders
        .doc(FirebaseConstants.currentUser!.uid)
        .set(order.toJson(), SetOptions(merge: true)));
  }
}

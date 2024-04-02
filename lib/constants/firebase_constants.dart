import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseConstants {
  static const usersCollection = "users";
  static const categories = "categories";
  static final user = FirebaseAuth.instance.currentUser!;
  static const productsCollection = "products";
  static const cartCollection = "cart";
  static const orderCollection="orders";
    static const paymentsCollection="payments";
  static final currentUser = FirebaseAuth.instance.currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static final cartRef = FirebaseFirestore.instance
      .collection("users")
      .doc(user.uid.toString());
       static final orderRef = FirebaseFirestore.instance
      .collection("users")
      .doc(user.uid.toString());
  //static final orderRef = FirebaseFirestore.instance.collection("Orders");
  static final addressRef =
      FirebaseFirestore.instance.collection("Adresses").doc(user.uid);
  static final favouriteRef =
      FirebaseFirestore.instance.collection("favourites").doc(user!.uid.toString());
}

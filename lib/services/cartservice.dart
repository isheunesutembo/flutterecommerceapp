import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ephamarcy/constants/firebase_constants.dart';
import 'package:ephamarcy/models/cart.dart';
import 'package:ephamarcy/models/product.dart';

class CartService {
  final FirebaseFirestore _firestore;
  CartService({required FirebaseFirestore firestore}):_firestore=firestore;
 var _products={};
  Future<void>addproduct(Product product)async{
    if(_products.containsKey(product)){
      _products[product]+=1;

    }else{
      _products[product]=1;
    }
  }

}

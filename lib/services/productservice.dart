import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ephamarcy/constants/firebase_constants.dart';
import 'package:ephamarcy/core/failure.dart';
import 'package:ephamarcy/models/product.dart';
import 'package:ephamarcy/providers/firebaseproviders/firebaseproviders.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final productsServiceProvider=Provider((ref){
  return ProductService(firestore: ref.watch(firebaseFirestoreProvider));
  
});

class ProductService {
  final FirebaseFirestore _firestore;

  ProductService({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _products =>
      _firestore.collection(FirebaseConstants.productsCollection);

  Either<dynamic, Future<void>> addProduct(Product product) {
    try {
      return right(_products.doc(product.productId.toString()).set(product.toJson()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  Stream<List<Product>> getProducts() {
    return _products.snapshots().map((event) {
      List<Product> products = [];
      
      for (var doc in event.docs) {
        products.add(Product.fromMap(doc.data()as Map<String,dynamic>));
       
      }

      return products;
    });
  }

  


  Stream<Product>getProductById(String productId){
    return _products.doc(productId).snapshots()
    .map((event) => Product.fromMap((event.data() as Map<String, dynamic>)));

  }

  Stream<List<Product>>searchProducts(String query){
    return _products.where(
          'name',
          isGreaterThanOrEqualTo: query.isEmpty ? 0 : query,
          isLessThan: query.isEmpty
              ? null
              : query.substring(0, query.length - 1) +
                  String.fromCharCode(
                    query.codeUnitAt(query.length - 1) + 1,
                  ),
        ).snapshots().map((event) {
          List<Product>products=[];
          for (var product in event.docs){
            products.add(Product.fromMap(product.data()as Map<String,dynamic>));

          }
          return products;
        });

  }
   Either<dynamic, Future<void>> updateProduct(Product product) {
    try {
      return right(_products.doc(product.productId.toString()).update(product.toMap()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}

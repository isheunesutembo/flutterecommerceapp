import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ephamarcy/constants/firebase_constants.dart';
import 'package:ephamarcy/core/failure.dart';
import 'package:ephamarcy/models/product.dart';
import 'package:ephamarcy/providers/firebaseproviders/firebaseproviders.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final productsServiceProvider = Provider((ref) {
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
      return right(
          _products.doc(product.productId.toString()).set(product.toJson()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  Stream<List<Product>> getProducts() {
    return _products.limit(10).snapshots().map((event) {
      List<Product> products = [];

      for (var doc in event.docs) {
        products.add(Product.fromJson(doc.data() as Map<String, dynamic>));
      }

      return products;
    });
  }

  Stream<Product> getProductById(String productId) {
    return _products.doc(productId).snapshots().map(
        (event) => Product.fromJson((event.data() as Map<String, dynamic>)));
  }

  Stream<List<Product>> searchProducts(String search) {
    return _products
        .orderBy("name")
        .startAt([search])
        .endAt([search + '\uf8ff'])
        .limit(10)
        .snapshots()
        .map((event) {
          List<Product> products = [];
          for (var doc in event.docs) {
            products.add(Product.fromJson(doc.data() as Map<String, dynamic>));
          }
          return products;
        });
  }

  Either<dynamic, Future<void>> updateProduct(Product product) {
    try {
      return right(
          _products.doc(product.productId.toString()).update(product.toJson()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  Stream<List<Product>> getProductsByCategoryName(String categoryname) {
    return _products
        .where("categoryname", isEqualTo: categoryname)
        .snapshots()
        .map((event) {
      List<Product> products = [];
      for (var doc in event.docs) {
        products.add(Product.fromJson(doc.data() as Map<String, dynamic>));
      }
      return products;
    });
  }

  Stream<List<Product>> getRelatedProducts(String categoryname) {
    return _products
        .where("categoryname", isEqualTo: categoryname)
        .snapshots()
        .map((event) {
      List<Product> products = [];
      for (var doc in event.docs) {
        products.add(Product.fromJson(doc.data() as Map<String, dynamic>));
      }
      return products;
    });
  }
}

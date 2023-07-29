

import 'package:ephamarcy/constants/firebase_constants.dart';
import 'package:ephamarcy/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/favourite.dart';
final favouritesControllerProvider=StateNotifierProvider<FavouriteProductsController,bool>((ref)=>FavouriteProductsController());

class FavouriteProductsController extends StateNotifier<bool>{
  FavouriteProductsController():super(false);
  List<Product> _productsList = [];
  List<Product> _favouriteProductsList = [];
  List<Product> get products => _productsList;
  List<Product> get favouriteProducts => _favouriteProductsList;

  Future<void> fetchAndSetFavouriteProduct() async {
    favouriteProducts.clear();
    FirebaseConstants.favouriteRef.snapshots().listen((documentSnapshot) {
      Favourite favourite =
          Favourite.fromJson(documentSnapshot.data() as Map<String, dynamic>);
      _favouriteProductsList = favourite.products;
    });
  }

  Future<void> toggleFavouriteStatus(bool isFavourite, Product product) async {
    isFavourite= !isFavourite;

    await FirebaseConstants.favouriteRef.get().then((documentSnapShot) async{
      if(isFavourite){
        if(documentSnapShot.exists){
          Favourite favouriteProducts=Favourite.fromJson(documentSnapShot.data()as Map<String,dynamic>);
          favouriteProducts.products.add(product);
          await FirebaseConstants.favouriteRef.set(Favourite(products: favouriteProducts.products).toJson());
        }else{
          List<Product>favouriteProducts=[];
          favouriteProducts.add(product);
          await FirebaseConstants
          .favouriteRef.set(Favourite(products: favouriteProducts).toJson());
        }
      }else{
        Favourite favouriteProducts=
        Favourite.fromJson(documentSnapShot.data()as Map<String,dynamic>);
        favouriteProducts.products.remove(product);
        await FirebaseConstants.favouriteRef.set(Favourite(products: favouriteProducts.products).toJson());



      }

    });
  }
}

import 'package:ephamarcy/core/utils.dart';
import 'package:ephamarcy/models/product.dart';
import 'package:ephamarcy/services/localservice/productwisahlist.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive/hive.dart';

class ProductWishListController extends GetxController{

  final Box _observableBox=ProductWishListRepository.getBox();
  Box get observableBox=>_observableBox;
  int get productsCount=>_observableBox.length;
  init(){
    getProducts();
  }

  addProduct(Product product,BuildContext context){
    _observableBox.add(product);
    showSnackBar(context, "Product added to wishlist");
    update();
  }

  getProducts(){
    _observableBox;
  }

  deleteProduct(int index,BuildContext context){
    _observableBox.deleteAt(index);
    showSnackBar(context, "Product $index removed from wishlist");
    update();
  }
}
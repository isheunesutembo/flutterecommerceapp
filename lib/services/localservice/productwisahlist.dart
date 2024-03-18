
import 'package:ephamarcy/models/product.dart';
import 'package:hive/hive.dart';

class ProductWishListRepository{
  static const String boxName="products_box";
  static openBox()async=>await Hive.openBox<Product>(boxName);
  static Box getBox()=>Hive.box<Product>(boxName);
  static closeBox()async=>await Hive.box(boxName).close();
  static clearBox()async=>await Hive.box(boxName).clear();
}
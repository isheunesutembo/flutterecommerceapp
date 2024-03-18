import'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'product.freezed.dart';
part 'product.g.dart';
List<Product> productFromJson(dynamic str) =>
 List<Product>.from((str).map((e) => Product.fromJson(e)));
@freezed

@HiveType(typeId: 0)
abstract class Product with _$Product{
  factory Product({
  @HiveField(0)
  String? productId,
  @HiveField(1)
  String? image,
  @HiveField(2)
  String? name,
  @HiveField(3)
  double? price,
  @HiveField(4)
   int? qty,
   @HiveField(5)
  double? oldprice,
  @HiveField(6)
  bool? isAvailable,
  @HiveField(7)
  String? description,
  @HiveField(8)
  String? categoryname,
  })=_Product;
   factory Product.fromJson(Map<String,dynamic>json)=> _$ProductFromJson(json);
}
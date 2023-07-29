import'package:freezed_annotation/freezed_annotation.dart';
part 'product.freezed.dart';
part 'product.g.dart';
List<Product> productFromJson(dynamic str) =>
 List<Product>.from((str).map((e) => Product.fromJson(e)));
@freezed

abstract class Product with _$Product{
  factory Product({
  String? productId,
  String? image,
  String? name,
  double? price,
   int? qty,
  double? oldprice,
  bool? isAvailable,
  String? description,
  String? categoryname,
  })=_Product;
   factory Product.fromJson(Map<String,dynamic>json)=> _$ProductFromJson(json);
}
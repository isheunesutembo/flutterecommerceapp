import 'package:ephamarcy/models/product.dart';
import'package:freezed_annotation/freezed_annotation.dart';
part 'cart.freezed.dart';
part 'cart.g.dart';
@freezed
abstract class Cart with _$Cart{
  factory Cart({
   required double? total,
    required List<Product>?products
  })=_Cart;
  factory Cart.fromJson(Map<String,dynamic>json)=>_$CartFromJson(json);
}
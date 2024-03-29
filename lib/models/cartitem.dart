import'package:freezed_annotation/freezed_annotation.dart';
part 'cartitem.freezed.dart';
part 'cartitem.g.dart';
List<CartItem>cartFromJson(dynamic str) =>
 List<CartItem>.from((str).map((e) => CartItem.fromJson(e)));


@freezed
abstract class CartItem with _$CartItem{
  factory CartItem({
    required String cartId ,
    required String image,
    required String productId,
    required int quantity,
    required double cost,
    required String name,
    required double price
  })=_CartItem;
  factory CartItem.fromJson(Map<String,dynamic>json)=>_$CartItemFromJson(json);
}
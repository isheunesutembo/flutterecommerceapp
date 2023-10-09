// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartitem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartItem _$$_CartItemFromJson(Map<String, dynamic> json) => _$_CartItem(
      cartId: json['cartId'] as String,
      image: json['image'] as String,
      productId: json['productId'] as String,
      quantity: json['quantity'] as int,
      cost: (json['cost'] as num).toDouble(),
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$_CartItemToJson(_$_CartItem instance) =>
    <String, dynamic>{
      'cartId': instance.cartId,
      'image': instance.image,
      'productId': instance.productId,
      'quantity': instance.quantity,
      'cost': instance.cost,
      'name': instance.name,
      'price': instance.price,
    };

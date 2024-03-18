// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartitem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      cartId: json['cartId'] as String,
      image: json['image'] as String,
      productId: json['productId'] as String,
      quantity: json['quantity'] as int,
      cost: (json['cost'] as num).toDouble(),
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{
      'cartId': instance.cartId,
      'image': instance.image,
      'productId': instance.productId,
      'quantity': instance.quantity,
      'cost': instance.cost,
      'name': instance.name,
      'price': instance.price,
    };

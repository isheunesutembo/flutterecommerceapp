// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      productId: json['productId'] as String?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      qty: json['qty'] as int?,
      oldprice: (json['oldprice'] as num?)?.toDouble(),
      isAvailable: json['isAvailable'] as bool?,
      description: json['description'] as String?,
      categoryname: json['categoryname'] as String?,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'image': instance.image,
      'name': instance.name,
      'price': instance.price,
      'qty': instance.qty,
      'oldprice': instance.oldprice,
      'isAvailable': instance.isAvailable,
      'description': instance.description,
      'categoryname': instance.categoryname,
    };

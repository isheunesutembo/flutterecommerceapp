// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      uid: json['uid'] as String,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      city: json['city'] as String?,
      address: json['address'] as String?,
      profileImage: json['profileImage'] as String?,
      cart: (json['cart'] as List<dynamic>?)
          ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => Orders.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'city': instance.city,
      'address': instance.address,
      'profileImage': instance.profileImage,
      'cart': instance.cart,
      'orders': instance.orders,
    };

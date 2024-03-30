// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrdersImpl _$$OrdersImplFromJson(Map<String, dynamic> json) => _$OrdersImpl(
      uid: json['uid'] as String?,
      products: (json['products'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toDouble(),
      orderId: json['orderId'] as String,
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      isAccepted: json['isAccepted'] as bool?,
      isDelivered: json['isDelivered'] as bool?,
      isCancelled: json['isCancelled'] as bool?,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$OrdersImplToJson(_$OrdersImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'products': instance.products.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'orderId': instance.orderId,
      'address': instance.address.toJson(),
      'isAccepted': instance.isAccepted,
      'isDelivered': instance.isDelivered,
      'isCancelled': instance.isCancelled,
      'date': instance.date.toIso8601String(),
    };

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
      orderStatus: $enumDecode(_$OrderStatusEnumMap, json['orderStatus']),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$OrdersImplToJson(_$OrdersImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'products': instance.products.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'orderId': instance.orderId,
      'address': instance.address.toJson(),
      'orderStatus': _$OrderStatusEnumMap[instance.orderStatus]!,
      'date': instance.date.toIso8601String(),
    };

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 'pending',
  OrderStatus.processing: 'processing',
  OrderStatus.delivered: 'delivered',
};

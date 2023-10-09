// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Orders _$$_OrdersFromJson(Map<String, dynamic> json) => _$_Orders(
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toDouble(),
      orderId: json['orderId'] as String,
      orderStatus: json['orderStatus'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_OrdersToJson(_$_Orders instance) => <String, dynamic>{
      'address': instance.address,
      'products': instance.products,
      'total': instance.total,
      'orderId': instance.orderId,
      'orderStatus': instance.orderStatus,
      'date': instance.date.toIso8601String(),
    };

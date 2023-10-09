// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddressModel _$$_AddressModelFromJson(Map<String, dynamic> json) =>
    _$_AddressModel(
      city: json['city'] as String,
      address: json['address'] as String,
      houseNo: json['houseNo'] as String,
      zipCode: json['zipCode'] as int,
    );

Map<String, dynamic> _$$_AddressModelToJson(_$_AddressModel instance) =>
    <String, dynamic>{
      'city': instance.city,
      'address': instance.address,
      'houseNo': instance.houseNo,
      'zipCode': instance.zipCode,
    };

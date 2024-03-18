// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressModelImpl _$$AddressModelImplFromJson(Map<String, dynamic> json) =>
    _$AddressModelImpl(
      city: json['city'] as String,
      address: json['address'] as String,
      houseNo: json['houseNo'] as String,
      zipCode: json['zipCode'] as int,
    );

Map<String, dynamic> _$$AddressModelImplToJson(_$AddressModelImpl instance) =>
    <String, dynamic>{
      'city': instance.city,
      'address': instance.address,
      'houseNo': instance.houseNo,
      'zipCode': instance.zipCode,
    };

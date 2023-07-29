// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Address _$$_AddressFromJson(Map<String, dynamic> json) => _$_Address(
      city: json['city'] as String,
      address: json['address'] as String,
      country: json['country'] as String,
      zipCode: json['zipCode'] as int,
    );

Map<String, dynamic> _$$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'city': instance.city,
      'address': instance.address,
      'country': instance.country,
      'zipCode': instance.zipCode,
    };

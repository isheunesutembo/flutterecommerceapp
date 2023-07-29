// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Favourite _$$_FavouriteFromJson(Map<String, dynamic> json) => _$_Favourite(
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FavouriteToJson(_$_Favourite instance) =>
    <String, dynamic>{
      'products': instance.products,
    };

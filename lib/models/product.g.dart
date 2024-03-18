// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 0;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      productId: fields[0] as String?,
      image: fields[1] as String?,
      name: fields[2] as String?,
      price: fields[3] as double?,
      qty: fields[4] as int?,
      oldprice: fields[5] as double?,
      isAvailable: fields[6] as bool?,
      description: fields[7] as String?,
      categoryname: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.productId)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.qty)
      ..writeByte(5)
      ..write(obj.oldprice)
      ..writeByte(6)
      ..write(obj.isAvailable)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.categoryname);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
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

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
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

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  String? get productId => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  int? get qty => throw _privateConstructorUsedError;
  double? get oldprice => throw _privateConstructorUsedError;
  bool? get isAvailable => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get categoryname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {String? productId,
      String? image,
      String? name,
      double? price,
      int? qty,
      double? oldprice,
      bool? isAvailable,
      String? description,
      String? categoryname});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? image = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? qty = freezed,
    Object? oldprice = freezed,
    Object? isAvailable = freezed,
    Object? description = freezed,
    Object? categoryname = freezed,
  }) {
    return _then(_value.copyWith(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int?,
      oldprice: freezed == oldprice
          ? _value.oldprice
          : oldprice // ignore: cast_nullable_to_non_nullable
              as double?,
      isAvailable: freezed == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryname: freezed == categoryname
          ? _value.categoryname
          : categoryname // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$_ProductCopyWith(
          _$_Product value, $Res Function(_$_Product) then) =
      __$$_ProductCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? productId,
      String? image,
      String? name,
      double? price,
      int? qty,
      double? oldprice,
      bool? isAvailable,
      String? description,
      String? categoryname});
}

/// @nodoc
class __$$_ProductCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$_Product>
    implements _$$_ProductCopyWith<$Res> {
  __$$_ProductCopyWithImpl(_$_Product _value, $Res Function(_$_Product) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? image = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? qty = freezed,
    Object? oldprice = freezed,
    Object? isAvailable = freezed,
    Object? description = freezed,
    Object? categoryname = freezed,
  }) {
    return _then(_$_Product(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int?,
      oldprice: freezed == oldprice
          ? _value.oldprice
          : oldprice // ignore: cast_nullable_to_non_nullable
              as double?,
      isAvailable: freezed == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryname: freezed == categoryname
          ? _value.categoryname
          : categoryname // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Product implements _Product {
  _$_Product(
      {this.productId,
      this.image,
      this.name,
      this.price,
      this.qty,
      this.oldprice,
      this.isAvailable,
      this.description,
      this.categoryname});

  factory _$_Product.fromJson(Map<String, dynamic> json) =>
      _$$_ProductFromJson(json);

  @override
  final String? productId;
  @override
  final String? image;
  @override
  final String? name;
  @override
  final double? price;
  @override
  final int? qty;
  @override
  final double? oldprice;
  @override
  final bool? isAvailable;
  @override
  final String? description;
  @override
  final String? categoryname;

  @override
  String toString() {
    return 'Product(productId: $productId, image: $image, name: $name, price: $price, qty: $qty, oldprice: $oldprice, isAvailable: $isAvailable, description: $description, categoryname: $categoryname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Product &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.oldprice, oldprice) ||
                other.oldprice == oldprice) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryname, categoryname) ||
                other.categoryname == categoryname));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productId, image, name, price,
      qty, oldprice, isAvailable, description, categoryname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      __$$_ProductCopyWithImpl<_$_Product>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  factory _Product(
      {final String? productId,
      final String? image,
      final String? name,
      final double? price,
      final int? qty,
      final double? oldprice,
      final bool? isAvailable,
      final String? description,
      final String? categoryname}) = _$_Product;

  factory _Product.fromJson(Map<String, dynamic> json) = _$_Product.fromJson;

  @override
  String? get productId;
  @override
  String? get image;
  @override
  String? get name;
  @override
  double? get price;
  @override
  int? get qty;
  @override
  double? get oldprice;
  @override
  bool? get isAvailable;
  @override
  String? get description;
  @override
  String? get categoryname;
  @override
  @JsonKey(ignore: true)
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      throw _privateConstructorUsedError;
}

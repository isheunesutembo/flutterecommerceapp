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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  @HiveField(0)
  String? get productId => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get image => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(3)
  double? get price => throw _privateConstructorUsedError;
  @HiveField(4)
  int? get qty => throw _privateConstructorUsedError;
  @HiveField(5)
  double? get oldprice => throw _privateConstructorUsedError;
  @HiveField(6)
  bool? get isAvailable => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(8)
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
      {@HiveField(0) String? productId,
      @HiveField(1) String? image,
      @HiveField(2) String? name,
      @HiveField(3) double? price,
      @HiveField(4) int? qty,
      @HiveField(5) double? oldprice,
      @HiveField(6) bool? isAvailable,
      @HiveField(7) String? description,
      @HiveField(8) String? categoryname});
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
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? productId,
      @HiveField(1) String? image,
      @HiveField(2) String? name,
      @HiveField(3) double? price,
      @HiveField(4) int? qty,
      @HiveField(5) double? oldprice,
      @HiveField(6) bool? isAvailable,
      @HiveField(7) String? description,
      @HiveField(8) String? categoryname});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
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
    return _then(_$ProductImpl(
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
class _$ProductImpl implements _Product {
  _$ProductImpl(
      {@HiveField(0) this.productId,
      @HiveField(1) this.image,
      @HiveField(2) this.name,
      @HiveField(3) this.price,
      @HiveField(4) this.qty,
      @HiveField(5) this.oldprice,
      @HiveField(6) this.isAvailable,
      @HiveField(7) this.description,
      @HiveField(8) this.categoryname});

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  @HiveField(0)
  final String? productId;
  @override
  @HiveField(1)
  final String? image;
  @override
  @HiveField(2)
  final String? name;
  @override
  @HiveField(3)
  final double? price;
  @override
  @HiveField(4)
  final int? qty;
  @override
  @HiveField(5)
  final double? oldprice;
  @override
  @HiveField(6)
  final bool? isAvailable;
  @override
  @HiveField(7)
  final String? description;
  @override
  @HiveField(8)
  final String? categoryname;

  @override
  String toString() {
    return 'Product(productId: $productId, image: $image, name: $name, price: $price, qty: $qty, oldprice: $oldprice, isAvailable: $isAvailable, description: $description, categoryname: $categoryname)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
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
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  factory _Product(
      {@HiveField(0) final String? productId,
      @HiveField(1) final String? image,
      @HiveField(2) final String? name,
      @HiveField(3) final double? price,
      @HiveField(4) final int? qty,
      @HiveField(5) final double? oldprice,
      @HiveField(6) final bool? isAvailable,
      @HiveField(7) final String? description,
      @HiveField(8) final String? categoryname}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  @HiveField(0)
  String? get productId;
  @override
  @HiveField(1)
  String? get image;
  @override
  @HiveField(2)
  String? get name;
  @override
  @HiveField(3)
  double? get price;
  @override
  @HiveField(4)
  int? get qty;
  @override
  @HiveField(5)
  double? get oldprice;
  @override
  @HiveField(6)
  bool? get isAvailable;
  @override
  @HiveField(7)
  String? get description;
  @override
  @HiveField(8)
  String? get categoryname;
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

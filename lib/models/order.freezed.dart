// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Orders _$OrdersFromJson(Map<String, dynamic> json) {
  return _Orders.fromJson(json);
}

/// @nodoc
mixin _$Orders {
  AddressModel get address => throw _privateConstructorUsedError;
  List<CartItem> get products => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  String get orderStatus => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrdersCopyWith<Orders> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersCopyWith<$Res> {
  factory $OrdersCopyWith(Orders value, $Res Function(Orders) then) =
      _$OrdersCopyWithImpl<$Res, Orders>;
  @useResult
  $Res call(
      {AddressModel address,
      List<CartItem> products,
      double total,
      String orderId,
      String orderStatus,
      DateTime date});

  $AddressModelCopyWith<$Res> get address;
}

/// @nodoc
class _$OrdersCopyWithImpl<$Res, $Val extends Orders>
    implements $OrdersCopyWith<$Res> {
  _$OrdersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? products = null,
    Object? total = null,
    Object? orderId = null,
    Object? orderStatus = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<$Res> get address {
    return $AddressModelCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrdersCopyWith<$Res> implements $OrdersCopyWith<$Res> {
  factory _$$_OrdersCopyWith(_$_Orders value, $Res Function(_$_Orders) then) =
      __$$_OrdersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AddressModel address,
      List<CartItem> products,
      double total,
      String orderId,
      String orderStatus,
      DateTime date});

  @override
  $AddressModelCopyWith<$Res> get address;
}

/// @nodoc
class __$$_OrdersCopyWithImpl<$Res>
    extends _$OrdersCopyWithImpl<$Res, _$_Orders>
    implements _$$_OrdersCopyWith<$Res> {
  __$$_OrdersCopyWithImpl(_$_Orders _value, $Res Function(_$_Orders) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? products = null,
    Object? total = null,
    Object? orderId = null,
    Object? orderStatus = null,
    Object? date = null,
  }) {
    return _then(_$_Orders(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Orders implements _Orders {
  _$_Orders(
      {required this.address,
      required final List<CartItem> products,
      required this.total,
      required this.orderId,
      required this.orderStatus,
      required this.date})
      : _products = products;

  factory _$_Orders.fromJson(Map<String, dynamic> json) =>
      _$$_OrdersFromJson(json);

  @override
  final AddressModel address;
  final List<CartItem> _products;
  @override
  List<CartItem> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final double total;
  @override
  final String orderId;
  @override
  final String orderStatus;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'Orders(address: $address, products: $products, total: $total, orderId: $orderId, orderStatus: $orderStatus, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Orders &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      address,
      const DeepCollectionEquality().hash(_products),
      total,
      orderId,
      orderStatus,
      date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrdersCopyWith<_$_Orders> get copyWith =>
      __$$_OrdersCopyWithImpl<_$_Orders>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrdersToJson(
      this,
    );
  }
}

abstract class _Orders implements Orders {
  factory _Orders(
      {required final AddressModel address,
      required final List<CartItem> products,
      required final double total,
      required final String orderId,
      required final String orderStatus,
      required final DateTime date}) = _$_Orders;

  factory _Orders.fromJson(Map<String, dynamic> json) = _$_Orders.fromJson;

  @override
  AddressModel get address;
  @override
  List<CartItem> get products;
  @override
  double get total;
  @override
  String get orderId;
  @override
  String get orderStatus;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_OrdersCopyWith<_$_Orders> get copyWith =>
      throw _privateConstructorUsedError;
}

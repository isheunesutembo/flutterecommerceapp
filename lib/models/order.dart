import 'package:ephamarcy/models/address.dart';
import 'package:ephamarcy/models/cartitem.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order.freezed.dart';
part 'order.g.dart';

@freezed
abstract class Orders with _$Orders {
  factory Orders(
      {required AddressModel address,
      required List<CartItem> products,
      required double total,
      required String orderId,
      required String orderStatus,
      required DateTime date}) = _Orders;
  factory Orders.fromJson(Map<String, dynamic> json) => _$OrdersFromJson(json);
}

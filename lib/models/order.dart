
import 'package:ephamarcy/models/address.dart';
import 'package:ephamarcy/models/product.dart';
import'package:freezed_annotation/freezed_annotation.dart';
part 'order.freezed.dart';
part 'order.g.dart';
List<Order> orderFromJson(dynamic str) =>
 List<Order>.from((str).map((e) => Order.fromJson(e)));
@freezed
abstract class Order with _$Order{
  factory Order({
    required String id,
    required double amount,
    required Address address,
    required List<Product>products,

  })=_Order;
   factory Order.fromJson(Map<String,dynamic>json)=> _$OrderFromJson(json);
}
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:ephamarcy/models/cartitem.dart';
import 'package:ephamarcy/models/order.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed

abstract class UserModel with _$UserModel {

  factory UserModel({
    required String uid,
    String? firstname,
    String? lastname,
    String? city,
    String? address,
    String? profileImage,
    List<CartItem>? cart,
    List<Orders>?orders
  }) = _Cart;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension CartExt on UserModel {
  double get grandTotal {
    return cart!.map((e) => e.cost*e.quantity).fold(0, (p, c) => p + c);
  }
}

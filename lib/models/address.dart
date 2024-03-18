import 'package:freezed_annotation/freezed_annotation.dart';
part 'address.freezed.dart';
part 'address.g.dart';
List<AddressModel>addressFromJson(dynamic str) =>
 List<AddressModel>.from((str).map((e) => AddressModel.fromJson(e)));
@freezed

abstract class AddressModel with _$AddressModel {
  factory AddressModel(
      {required String city,
      required String address,
      required String houseNo,
      required int zipCode}) = _AddressModel;
  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}

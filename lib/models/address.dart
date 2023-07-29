
import'package:freezed_annotation/freezed_annotation.dart';
part 'address.freezed.dart';
part 'address.g.dart';
@freezed
abstract class Address with _$Address{
  factory Address({
    required String city,
    required String address,
    required String country,
    required int zipCode

  })=_Address;
   factory Address.fromJson(Map<String,dynamic>json)=>_$AddressFromJson(json);
}
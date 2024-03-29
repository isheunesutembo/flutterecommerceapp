import 'package:ephamarcy/core/failure.dart';
import 'package:ephamarcy/models/address.dart';
import 'package:ephamarcy/services/addressservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final addressContollerProvider =
    StateNotifierProvider<AddressController, bool>((ref) {
  final addressService = ref.watch(addressServiceProvider);
  return AddressController(addressService: addressService, ref: ref);
});
final getUserAddress = StreamProvider((ref) {
  final address = ref.watch(addressContollerProvider.notifier);
  return address.getAddress();
});

class AddressController extends StateNotifier<bool> {
  final AddressService _addressService;
  final Ref _ref;
  AddressController({required AddressService addressService, required Ref ref})
      : _addressService = addressService,
        _ref = ref,
        super(false);

  void addAddress(BuildContext context, String address, String city,
      String houseNumber, int zipCode) {
    final addressModel = AddressModel(
        city: city, address: address, houseNo: houseNumber, zipCode: zipCode);
    final res = _addressService.addAddress(addressModel);
    res.fold(
        (l) => Failure(message: l.toString()),
        (r) => ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Address saved"))));
  }

  Stream<AddressModel> getAddress() {
    return _addressService.getAddress();
  }

  void updateAddress(BuildContext context, String address, String city,
      String houseNumber, int zipCode) {
    final addressModel = AddressModel(
        city: city, address: address, houseNo: houseNumber, zipCode: zipCode);
    final res = _addressService.updateAddress(addressModel);
    res.fold(
        (l) => Failure(message: l.toString()),
        (r) => ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Address saved"))));
  }
}

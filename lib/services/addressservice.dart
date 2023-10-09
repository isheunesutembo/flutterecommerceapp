import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ephamarcy/constants/firebase_constants.dart';
import 'package:ephamarcy/core/failure.dart';
import 'package:ephamarcy/models/address.dart';
import 'package:ephamarcy/providers/firebaseproviders/firebaseproviders.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fpdart/fpdart.dart';

final addressServiceProvider = Provider(
    (ref) => AddressService(firestore: ref.watch(firebaseFirestoreProvider)));

class AddressService {
  final FirebaseFirestore _firestore;
  AddressService({required FirebaseFirestore firestore})
      : _firestore = firestore;

  Either<dynamic, Future<void>> addAddress(AddressModel address) {
    try {
      return right(FirebaseConstants.addressRef.set(address.toJson()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  Stream<AddressModel> getAddress() {
    return FirebaseConstants.addressRef.snapshots().map((event) =>
        AddressModel.fromJson((event.data() as Map<String, dynamic>)));
  }

  Either<dynamic, Future<void>> updateAddress(AddressModel address) {
    try {
      return right(FirebaseConstants.addressRef.update(address.toJson()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}

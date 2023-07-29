import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ephamarcy/constants/firebase_constants.dart';
import 'package:ephamarcy/models/address.dart';
import 'package:fpdart/fpdart.dart';

class AddressService {
  final FirebaseFirestore _firestore;
  AddressService({required FirebaseFirestore firestore})
      : _firestore = firestore;
}

import 'dart:io';
import 'package:ephamarcy/providers/firebaseproviders/firebaseproviders.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final storageServiceProvider=Provider((ref)=>FirebaseStorageService(firebaseStorage: ref.watch(firebaseStorageProvider)));
class FirebaseStorageService {
  final FirebaseStorage _firebaseStorage;
  FirebaseStorageService({required FirebaseStorage firebaseStorage})
      : _firebaseStorage = firebaseStorage;
}

import 'dart:io';

import 'package:ephamarcy/core/failure.dart';
import 'package:ephamarcy/core/type_defs.dart';
import 'package:ephamarcy/providers/firebaseproviders/firebaseproviders.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final storageServiceProvider=Provider((ref)=>StorageService(firebaseStorage: ref.watch(firebaseStorageProvider)));
class StorageService{
  final FirebaseStorage _firebaseStorage;
  StorageService({required FirebaseStorage firebaseStorage}):_firebaseStorage=firebaseStorage;
  FutureEither<String>storeFile({required String path,
  required String id,
  required File? file,
  }
  )async{
    try{
      final ref=_firebaseStorage.ref().child(path).child(id);
      UploadTask uploadTask;
      
        uploadTask=ref.putFile(file!);
      
      final snapShot=await uploadTask;
      return right(await snapShot.ref.getDownloadURL());
    }catch(e){
      return left(Failure(message: e.toString()));
    }
    

  }
}
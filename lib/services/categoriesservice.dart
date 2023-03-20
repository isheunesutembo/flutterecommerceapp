import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ephamarcy/constants/firebase_constants.dart';
import 'package:ephamarcy/models/categories.dart';
import 'package:ephamarcy/providers/firebaseproviders/firebaseproviders.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoriesServiceProvider=Provider((ref)=>CategoriesService(fireStore: ref.watch(firebaseFirestoreProvider)));
class CategoriesService {
  final FirebaseFirestore _fireStore;
  CategoriesService({required FirebaseFirestore fireStore})
      : _fireStore = fireStore;

  CollectionReference get _categories =>
      _fireStore.collection(FirebaseConstants.categories);

  Stream<List<Categories>> getCategories() {
    return _categories.snapshots().map((event){
      List<Categories>categoriesList=[];
      for (var doc in event.docs){
        categoriesList.add(Categories.fromMap(doc.data() as Map<String,dynamic>));
      }
      return categoriesList;
    });
  }
}

import 'package:ephamarcy/models/categories.dart';
import 'package:ephamarcy/services/categoriesservice.dart';
import 'package:ephamarcy/services/firebasestorageservice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoriesProvider=StreamProvider((ref){
  final categoriesController=ref.watch(categoriesControllerProvider.notifier);
  return categoriesController.getCategoris();

});

final categoriesControllerProvider=StateNotifierProvider<CategoriesController,bool>((ref){
  final categoriesService=ref.watch(categoriesServiceProvider);
  final firebaseStorageServiceProvider=ref.watch(storageServiceProvider);
  return CategoriesController(categoriesService: categoriesService, ref: ref, firebaseStorageService: firebaseStorageServiceProvider);
});
class CategoriesController extends StateNotifier<bool>{

  final CategoriesService _categoriesSevice;
  final Ref _ref;
  final FirebaseStorageService _firebaseStorageService;

  CategoriesController({required CategoriesService categoriesService,
  required Ref ref ,required FirebaseStorageService firebaseStorageService}):_categoriesSevice=categoriesService,_ref=ref,_firebaseStorageService=firebaseStorageService,super(false);



  Stream<List<Categories>>getCategoris(){

    return _categoriesSevice.getCategories();

  }



}
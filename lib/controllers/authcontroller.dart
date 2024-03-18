import 'dart:io';

import 'package:ephamarcy/models/user.dart';
import 'package:ephamarcy/services/authservice.dart';
import 'package:ephamarcy/services/storageservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) => AuthController(
        authService: ref.watch(
          authServiceProvider,
        ),
        storageService: ref.watch(storageServiceProvider),
        ref: ref));
final userProvider = StateProvider<UserModel?>((ref) => null);
final authStateChangeProvider = StreamProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.authStateChange;
});

final getUserDataProvider = StreamProvider.family((ref, String uid) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getUserData(uid);
});
final getUserDataFromFirestoreProvider = StreamProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getUserDataFromFirestore();
});


class AuthController extends StateNotifier<bool> {
  final AuthService _authService;
  final StorageService _storageService;
  final Ref _ref;
  AuthController(
      {required AuthService authService,
      required StorageService storageService,
      required Ref ref})
      : _authService = authService,
        _storageService = storageService,
        _ref = ref,
        super(false);

  Stream<User?> get authStateChange => _authService.authStateChange;
  //UserModel userModel = UserModel(uid: FirebaseAuth.instance.currentUser!.uid);
  void signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    state = true;
    final user = await _authService.signInWithEmailAndPassword(email, password);
    state = false;
    user.fold(
        (failure) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(failure.message))),
        (userModel) =>
            _ref.read(userProvider.notifier).update((state) => userModel));
  }

  signUpWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    state = true;
    final user = await _authService.signUpWithEmailAndPassword(email, password);
    state = false;
    user.fold(
        (failure) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(failure.message))),
        (userModel) =>
            _ref.read(userProvider.notifier).update((state) => userModel));
  }

  Future<void> signOut() async {
    _authService.signOut();
  }

  Stream<UserModel> getUserData(uid) {
    return _authService.getUserData(uid);
  }
  Stream<UserModel>getUserDataFromFirestore(){
    return _authService.getUserDataFromFirestore();
  }
  void updateUser(
    BuildContext context,
    File image,
    String firstname,
    String lastname,
  ) async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    User? user = _firebaseAuth.currentUser;
    final userId = user!.uid.toString();
    final imageRes = await _storageService.storeFile(
        path: '/profileimages', id: userId, file: image);
    imageRes.fold(
        (l) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l.message))), (r) {
      final user = UserModel(
          uid: userId,
          firstname: firstname,
          lastname: lastname,
          profileImage: r.toString());
      final res = _authService.updateUser(user);
      state = false;
      res.fold(
          (l) => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(l.message))),
          (r) => ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("profile updated"))));
    });
  }
}

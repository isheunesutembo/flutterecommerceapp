import 'package:ephamarcy/models/user.dart';
import 'package:ephamarcy/services/authservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) => AuthController(
        authService: ref.watch(
          authServiceProvider,
        ),
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

class AuthController extends StateNotifier<bool> {
  final AuthService _authService;
  final Ref _ref;
  AuthController({required AuthService authService, required Ref ref})
      : _authService = authService,
        _ref = ref,
        super(false);

  Stream<User?> get authStateChange => _authService.authStateChange;

  void signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    state = true;
    final user = await _authService.signInWithEmailAndPassword(email, password);
    state = false;
    user.fold(
        (failure) => Fluttertoast.showToast(msg: failure.message),
        (userModel) =>
            _ref.read(userProvider.notifier).update((state) => userModel));
  }

  signUpWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    state = true;
    final user = await _authService.signUpWithEmailAndPassword(email, password);
    state = false;
    user.fold(
        (failure) => Fluttertoast.showToast(msg: failure.message),
        (userModel) =>
            _ref.read(userProvider.notifier).update((state) => userModel));
  }

  Future<void> signOut() async {
    _authService.signOut();
  }

  Stream<UserModel> getUserData(uid) {
    return _authService.getUserData(uid);
  }
}

import 'package:ephamarcy/controllers/authcontroller.dart';
import 'package:ephamarcy/pages/signin.dart';
import 'package:ephamarcy/services/authservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> signOut() async {
      ref.read(authControllerProvider.notifier).signOut();
    }

final isLoading=ref.watch(authControllerProvider);
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            signOut();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignIn()));
          },
          child: Text("Logout"),
        ),
      ),
    );
  }
}

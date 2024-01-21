import 'package:ephamarcy/controllers/authcontroller.dart';
import 'package:ephamarcy/views/signin.dart';
import 'package:ephamarcy/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Register extends ConsumerStatefulWidget {
  const Register({super.key});

  @override
  ConsumerState<Register> createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<Register> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  signUpWithEmailAndPassword(
      BuildContext context, WidgetRef ref, String email, String password) {
    ref
        .read(authControllerProvider.notifier)
        .signUpWithEmailAndPassword(context, email, password);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);

    return isLoading
        ? const Loader()
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              iconTheme: Theme.of(context).iconTheme,
              backgroundColor: Colors.white,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                  child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/icon/pills.png",
                          height: 80,
                          width: 80,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        enableSuggestions: true,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          _email = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'email:',
                          hintStyle: const TextStyle(color: Colors.black),
                          prefixIcon: const Icon(Icons.email_outlined,
                              color: Colors.black, size: 20),
                          alignLabelWithHint: true,
                        ),
                        validator: ((value) {
                          if (value!.isEmpty || !value.contains("@")) {
                            return "Invalid email address";
                          }
                          return null;
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        enableSuggestions: true,
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) {
                          _password = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'password:',
                          hintStyle: const TextStyle(color: Colors.black),
                          prefixIcon: const Icon(Icons.email_outlined,
                              color: Colors.black, size: 20),
                          alignLabelWithHint: true,
                        ),
                        validator: ((value) {
                          if (value!.isEmpty || value.length < 6) {
                            return "Password is too short";
                          }
                          return null;
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        enableSuggestions: true,
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) {
                          _password = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'password:',
                          hintStyle: const TextStyle(color: Colors.black),
                          prefixIcon: const Icon(Icons.email_outlined,
                              color: Colors.black, size: 20),
                          alignLabelWithHint: true,
                        ),
                        validator: ((value) {
                          if (value != _password) {
                            return "Passwords do  not match";
                          }
                          return null;
                        }),
                      ),
                    ),
                    const Divider(thickness: 2),
                    Center(
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignIn(),
                                  ),
                                  (route) => false);
                            },
                            child: const Text(
                                "Already have an account ? SignIn",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)))),
                    SizedBox(
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            signUpWithEmailAndPassword(
                                context, ref, _email.trim(), _password.trim());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
                          },
                          child: const Text("Register"),
                        ))
                  ],
                ),
              )),
            ),
          );
  }
}

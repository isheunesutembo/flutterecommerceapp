import 'package:ephamarcy/controllers/authcontroller.dart';
import 'package:ephamarcy/views/home.dart';
import 'package:ephamarcy/views/register.dart';
import 'package:ephamarcy/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SignIn extends ConsumerStatefulWidget {
  SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    signInWithEmailAndPassword(context, ref, String email, String password) {
      ref
          .read(authControllerProvider.notifier)
          .signInWithEmailAndPassword(context, email, password);
    }

    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: isLoading
          ? const Loader()
          : SafeArea(
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
                    const Divider(thickness: 2),
                    Center(
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Register(),
                                ),
                              );
                            },
                            child: const Text("No account ? Register",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)))),
                    SizedBox(
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            signInWithEmailAndPassword(
                                context, ref, _email.trim(), _password.trim());

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          },
                          child: Text("LogIn"),
                        ))
                  ],
                ),
              )),
            ),
    );
  }
}

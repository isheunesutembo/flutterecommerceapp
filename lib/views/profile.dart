import 'dart:io';

import 'package:ephamarcy/controllers/authcontroller.dart';
import 'package:ephamarcy/widgets/errortext.dart';
import 'package:ephamarcy/widgets/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  File? image;
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _firstname.dispose();
    _lastname.dispose();
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 20);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      throw 'Failed to pick image';
    }
  }

  void selectProfileImage()async{
    final res=await pickImage();
    if(res!=null){
      setState(() {
        image=File(res.files.first.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    User? user = _firebaseAuth.currentUser;
    final userId = user!.uid.toString();
    final userData = ref.watch(getUserDataProvider(userId));
    final isLoading = ref.watch(authControllerProvider);
    

    return Scaffold(
      appBar: AppBar(elevation: 0,backgroundColor: Colors.white,),
      body: userData.when(
        data: (data) {
          _firstname=TextEditingController(text: data.firstname);
          _lastname=TextEditingController(text: data.lastname);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              iconTheme: Theme.of(context).iconTheme,
            ),
            body: SafeArea(
                child: SingleChildScrollView(
              child: Column(children: [
                Form(
                  key: _formKey,
                  child: Column(children: [
                    GestureDetector(
                      onTap: () {
                        pickImage();
                      },
                      child: Center(
                        child: data.profileImage != null
                            ? CircleAvatar(
                              radius: 60,
                              backgroundImage:NetworkImage(
                                  data.profileImage.toString(),
                                  
                                ),
                            )
                            : const CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage(
                                  "assets/icon/profile.png",
                                  
                                ),
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _firstname,
                        enableSuggestions: true,
                        keyboardType: TextInputType.streetAddress,
                        onChanged: (value) {
                          _firstname.text = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'firstname',
                          hintStyle: const TextStyle(color: Colors.black),
                          prefixIcon: const Icon(Icons.person,
                              color: Colors.black, size: 20),
                          alignLabelWithHint: true,
                        ),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Invalid firstname";
                          }
                          return null;
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _lastname,
                        enableSuggestions: true,
                        keyboardType: TextInputType.streetAddress,
                        onChanged: (value) {
                          _lastname.text = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'lastname',
                          hintStyle: const TextStyle(color: Colors.black),
                          prefixIcon: const Icon(Icons.person,
                              color: Colors.black, size: 20),
                          alignLabelWithHint: true,
                        ),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Invalid lastname";
                          }
                          return null;
                        }),
                      ),
                    ),
                    SizedBox(
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            ref
                                .watch(authControllerProvider.notifier)
                                .updateUser(context, image!, _firstname.text,
                                    _lastname.text);
                            Navigator.pop(context);
                          },
                          child: const Text("Update Profile"),
                        ))
                  ]),
                ),
              ]),
            )),
          );
        },
        error: (error, stackTrace) => ErrorText(error: error.toString()),
        loading: () => const Loader()),
    );
  }
}

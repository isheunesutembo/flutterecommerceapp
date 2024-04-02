
import 'package:ephamarcy/controllers/authcontroller.dart';
import 'package:ephamarcy/views/addresspage.dart';
import 'package:ephamarcy/views/orderstatuspage.dart';
import 'package:ephamarcy/views/profile.dart';
import 'package:ephamarcy/widgets/errortext.dart';
import 'package:ephamarcy/widgets/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> signOut() async {
      ref.read(authControllerProvider.notifier).signOut();
    }

    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    User? user = _firebaseAuth.currentUser;
    final userId = user!.uid.toString();
    final userData = ref.watch(getUserDataProvider(userId));
    final isLoading = ref.watch(authControllerProvider);
    return userData.when(
        data: (data) {
          return  Scaffold(
            body:  SingleChildScrollView(
            child: Column(
              children:[
                const SizedBox(
                  height: 16,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: data.profileImage != null
                            ? CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 60,
                                backgroundImage: NetworkImage(
                                  data.profileImage.toString(),
                                ))
                            : Image.asset(
                                "assets/icon/profile.png",
                                width: 90,
                                height: 90,
                              )),
                    const SizedBox(
                      height: 8,
                    ),
                    Center(
                      child: data.firstname != null
                          ? Text(
                              data.firstname.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          : const SizedBox(),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: const Text(
                        "Profile ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Image.asset(
                        "assets/icon/rightarrow.png",
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddressPage()));
                    },
                    child: ListTile(
                      leading: const Text(
                        "Address ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Image.asset(
                        "assets/icon/rightarrow.png",
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const OrderStatusPage()));
                    },
                    child: ListTile(
                      leading: const Text(
                        "Track Order",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Image.asset(
                        "assets/icon/rightarrow.png",
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                ),
                                const Divider(
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const OrderStatusPage()));
                    },
                    child: ListTile(
                      leading: const Text(
                        "Order History",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Image.asset(
                        "assets/icon/rightarrow.png",
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                ),
               
               
                const Divider(
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      ref.read(authControllerProvider.notifier).signOut();
                    },
                    child: ListTile(
                      leading: const Text(
                        "LogOut ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Image.asset(
                        "assets/icon/rightarrow.png",
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          );
        },
        error: (error, stackTrace) => ErrorText(error: error.toString()),
        loading: () => const Loader());
  }
}

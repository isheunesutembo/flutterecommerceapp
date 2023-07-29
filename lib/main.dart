import 'package:ephamarcy/common.dart/error.dart';
import 'package:ephamarcy/controllers/authcontroller.dart';
import 'package:ephamarcy/models/user.dart';
import 'package:ephamarcy/pages/errorscreen.dart';
import 'package:ephamarcy/pages/loadingscreen.dart';
import 'package:ephamarcy/pages/signin.dart';
import 'package:ephamarcy/router.dart';
import 'package:ephamarcy/widgets/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:routemaster/routemaster.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Stripe.publishableKey = "pk_test_YB5q2AxlwiIQihPRQEFlzPp5";
 // await Stripe.instance.applySettings();
  //await dotenv.load(fileName: "assets/.env");
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  UserModel? userModel;

  void getData(WidgetRef ref, User data) async {
    userModel = await ref
        .watch(authControllerProvider.notifier)
        .getUserData(data.uid)
        .first;
    ref.read(userProvider.notifier).update((state) => userModel);
  }

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(authStateChangeProvider).when(
        data: (data) => MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: Theme.of(context),
              routerDelegate: RoutemasterDelegate(routesBuilder: (context) {
                if (data != null) {
                  getData(ref, data);
                  return loggedInRoute;
                }
                return loggedOutRoute;
              }),
              routeInformationParser: RoutemasterParser(),
            ),
        error: (error, stackTrace) => ErrorText(error: error.toString()),
        loading: () => const Loader());
  }
}

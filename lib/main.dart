import 'package:ephamarcy/apikeys/apikey.dart';
import 'package:ephamarcy/controllers/authcontroller.dart';
import 'package:ephamarcy/firebase_options.dart';
import 'package:ephamarcy/models/user.dart';
import 'package:ephamarcy/router.dart';
import 'package:ephamarcy/widgets/errortext.dart';
import 'package:ephamarcy/widgets/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:routemaster/routemaster.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  Stripe.publishableKey = APIKey.PUBLISHABLEkEY;
  await Stripe.instance.applySettings();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  UserModel? userModel;
 getData(WidgetRef ref,User data)async{
  userModel=ref.watch(authControllerProvider.notifier).getUserData(data.uid).first as UserModel?;
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
                  return loggedOutRoute;
                }
                return loggedInRoute;
              }),
              routeInformationParser: RoutemasterParser(),
            ),
        error: (error, stackTrace) => ErrorText(error: error.toString()),
        loading: () => Loader());
  }
}

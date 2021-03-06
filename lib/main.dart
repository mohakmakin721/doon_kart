import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doon_kart/components/authentication_service.dart';
import 'package:doon_kart/routs.dart';
import 'package:doon_kart/screens/complete_profile/complete_profile_screen.dart';
import 'package:doon_kart/screens/login_success/login_success_screen.dart';
import 'package:doon_kart/screens/profile/profile_screen.dart';
import 'package:doon_kart/screens/sign_in/sign_in_screen.dart';
import 'package:doon_kart/screens/splash/splash_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'Theme.dart';
import 'package:flutter/material.dart';

import 'components/home_tab_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DoonKart',
        theme: theme(),
        //home: SplashScreen(),
        initialRoute: SplashScreen.routeName,
        routes: routes,
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final firebaseUser = context.watch<User>();
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    try {
      if (firebaseAuth.currentUser != null) {
        final uid = firebaseAuth.currentUser.uid;
        FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .get()
            .then((value) {
          if (!value.exists) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                CompleteProfileScreen.routeName,
                (Route<dynamic> route) => false);
          } else if (value.exists) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                SignInScreen.routeName, (Route<dynamic> route) => false);
          } else {
            Navigator.of(context).pushNamedAndRemoveUntil(
                HomeTabController.routeName, (Route<dynamic> route) => false);
          }
        }).catchError(
          (onError) => print(onError.message),
        );
      }
    } catch (e) {
      print(e);
    }

    return Container();
  }
}

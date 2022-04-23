import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:boba_time/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
          splash: "assets/images/logo.png",
          duration: 1000,
          splashTransition: SplashTransition.rotationTransition,
          backgroundColor: const Color.fromRGBO(56, 56, 56, 0.4),
          pageTransitionType: PageTransitionType.rightToLeftWithFade,
          nextScreen: const AppStartingPage()),
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
    );
  }
}

class AppStartingPage extends StatelessWidget {
  const AppStartingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LandingScreen();
  }
}

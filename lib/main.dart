import 'package:boba_time/screens/landing_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: const AppStartingPage(),
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

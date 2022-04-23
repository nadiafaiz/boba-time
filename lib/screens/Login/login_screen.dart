import 'package:boba_time/screens/Login/components/body.dart';
import 'package:boba_time/screens/landing_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffd8cf),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const LandingScreen();
                },
              ),
            );
          },
        ),
      ),
      body: Body(),
    );
  }
}

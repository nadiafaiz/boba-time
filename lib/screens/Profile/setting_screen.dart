import 'package:boba_time/components/components.dart';
import 'package:boba_time/constants.dart';
import 'package:boba_time/screens/Profile/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primarylightColor,
        title: const Text("Password Setting"),
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            const SizedBox(height: 20),
            const Text(
              "Change Your Password",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            RoundedPasswordField(
              hintText: "Enter New Password",
              validator: (value) {
                if (value!.isEmpty) {
                  return ("Password is required to reset");
                }
                return null;
              },
              onChanged: (value) {
                passwordController.text = value;
              },
            ),
            const SizedBox(height: 20),
            RoundedPasswordField(
              hintText: "Re-enter New Password",
              validator: (value) {
                if (value!.isEmpty) {
                  return ("Re-enter Password to reset");
                }
                return null;
              },
              onChanged: (value) {
                passwordController.text = value;
              },
            ),
            const SizedBox(height: 20),
            RoundedButton(
              text: "SUBMIT",
              press: () => {
                _changePassword(passwordController.text),
                Fluttertoast.showToast(msg: "Password Changed!"),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}

void _changePassword(String newPassword) async {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? currentUser = firebaseAuth.currentUser;
  currentUser?.updatePassword(newPassword).then((_){
    // print("Successfully changed password");
  }).catchError((error){
    // print("Password can't be changed");
  });
}


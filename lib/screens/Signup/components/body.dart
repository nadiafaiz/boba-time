import 'package:boba_time/components/round_button.dart';
import 'package:boba_time/components/round_input_field.dart';
import 'package:boba_time/components/round_password_field.dart';
import 'package:boba_time/screens/Login/login_screen.dart';
import 'package:boba_time/screens/Signup/components/background.dart';
import 'package:flutter/material.dart';

import '../../../components/already_have_account_check.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "SIGN UP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Image(
              image: AssetImage(
                'assets/images/signup.png',
              ),
              fit: BoxFit.cover,
            ),
            RoundedInputField(
              hintText: "Full Name",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Your email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGN UP",
              press: () {},
            ),
            AlreadyHaveAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

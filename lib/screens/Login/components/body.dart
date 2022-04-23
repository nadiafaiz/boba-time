import 'package:boba_time/components/round_button.dart';
import 'package:boba_time/screens/Signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:boba_time/screens/Login/components/background.dart';

import '../../../components/already_have_account_check.dart';
import '../../../components/round_input_field.dart';
import '../../../components/round_password_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Image(
            image: AssetImage(
              'assets/images/login.png',
            ),
            fit: BoxFit.cover,
          ),
          RoundedInputField(
            hintText: "Your email",
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            onChanged: (value) {},
          ),
          const SizedBox(height: 10),
          RoundedButton(text: "LOG IN", press: () {}),
          const SizedBox(height: 10),
          AlreadyHaveAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

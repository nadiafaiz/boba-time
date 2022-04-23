import 'package:boba_time/components/round_button.dart';
import 'package:boba_time/screens/Signup/signup_screen.dart';
import 'package:boba_time/screens/home_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:boba_time/screens/Login/components/background.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../components/already_have_account_check.dart';
import '../../../components/round_input_field.dart';
import '../../../components/round_password_field.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Email is required to log in");
                  }

                  if (!EmailValidator.validate(value)) {
                    return ("Please enter a valid email address");
                  }
                },
                onChanged: (value) {
                  emailController.text = value;
                },
              ),
              RoundedPasswordField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Password is required to log in");
                  }
                },
                onChanged: (value) {
                  passwordController.text = value;
                },
              ),
              const SizedBox(height: 10),
              RoundedButton(
                text: "LOG IN",
                press: () => {
                  _logIn(
                      context, emailController.text, passwordController.text),
                },
              ),
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
        ),
      ),
    );
  }

  void _logIn(
      BuildContext context, final String email, final String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
            (uid) => {
              Fluttertoast.showToast(msg: "Login successful!"),
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              )
            },
          )
          .catchError(
            (error) => {
              Fluttertoast.showToast(
                  msg:
                      "That account does not exist. Enter a different account or create a new one."),
            },
          );
    }
  }
}

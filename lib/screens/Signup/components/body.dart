import 'package:boba_time/components/round_button.dart';
import 'package:boba_time/components/round_input_field.dart';
import 'package:boba_time/components/round_password_field.dart';
import 'package:boba_time/screens/Login/login_screen.dart';
import 'package:boba_time/screens/Signup/components/background.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../components/already_have_account_check.dart';
import '../../../model/user_model.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;
  final TextEditingController fullNameController = TextEditingController();
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Please enter your name");
                  }
                },
                onChanged: (value) {
                  fullNameController.text = value;
                },
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

                  if (value.length < 8) {
                    return ("Password must be at least 8 characters long");
                  }
                },
                onChanged: (value) {
                  passwordController.text = value;
                },
              ),
              RoundedButton(
                text: "SIGN UP",
                press: () => {
                  _register(
                      context, emailController.text, passwordController.text),
                },
              ),
              AlreadyHaveAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _register(
      BuildContext context, final String email, final String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
            (value) => {
              _publishFirestoreDetails(context),
            },
          )
          .catchError(
            (error) => {
              Fluttertoast.showToast(msg: error!.message),
            },
          );
    }
  }

  _publishFirestoreDetails(BuildContext context) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel(
      uid: user!.uid,
      email: user.email,
      fullName: fullNameController.text,
      role: Role.user.name,
      timestamp: Timestamp.now(),
    );

    await firestore.collection("users").doc(user.uid).set(userModel.toMap());

    Fluttertoast.showToast(msg: "Account created successfully!");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }
}

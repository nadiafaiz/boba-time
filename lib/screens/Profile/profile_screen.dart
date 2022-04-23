import 'package:boba_time/constants.dart';
import 'package:flutter/material.dart';
import 'package:boba_time/screens/Profile/components/body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primarylightColor,
        title: const Text("Profile"),
      ),
      body: const Body(),
      // bottomNavigationBar: CustomBottomNa,
    );
  }
  
}
import 'package:boba_time/constants.dart';
import 'package:flutter/material.dart';
import 'package:boba_time/screens/Reward/components/body.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primarylightColor,
        title: const Text("Reward"),
      ),
      body: const Body(),
      // bottomNavigationBar: CustomBottomNa,
    );
  }

}
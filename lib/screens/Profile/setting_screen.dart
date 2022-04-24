import 'package:boba_time/components/switch_button.dart';
import 'package:boba_time/constants.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primarylightColor,
        title: const Text("Setting"),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Noti(
            text: "Notification on Boba News",
            press: () {},
          ),
          Noti(
            text: "Notification on Special Offers",
            press: () {},
          ),
          Noti(
            text: "Notification on Order Updates",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class Noti extends StatelessWidget {
  const Noti({
    Key? key,
    required this.text,
    this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: primaryColor,
          padding: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: primarylightColor,
        ),
        onPressed: press,
        child: Row(
          children: [
            const SizedBox(width: 20),
            Expanded(child: Text(text)),
            const MySwitchButton(),
          ],
        ),
      ),
    );
  }
}

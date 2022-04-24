import 'package:boba_time/components/switch_button.dart';
import 'package:boba_time/constants.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primarylightColor,
        title: const Text("Notification"),
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
        children: const [
          SizedBox(height: 20),
          Noti(
            text: "Notification on Boba News",
          ),
          Noti(
            text: "Notification on Special Offers",
          ),
          Noti(
            text: "Notification on Order Updates",
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
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
          color: primarylightColor,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Expanded(child: Text(text, style: const TextStyle(fontSize: 15))),
            const MySwitchButton(),
          ],
        ),
      ),
    );
  }
}

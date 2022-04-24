import 'package:boba_time/screens/Profile/setting_screen.dart';
import 'package:boba_time/screens/screens.dart';
import 'package:flutter/material.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            image: "assets/images/coffee-bag.png",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const RewardScreen();
                  },
                ),
              );
            },
          ),
          ProfileMenu(
            text: "Notifications",
            image: "assets/images/coffee-shop.png",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const NotificationScreen();
                  },
                ),
              );
            },
          ),
          ProfileMenu(
            text: "Settings",
            image: "assets/images/cookie.png",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SettingScreen();
                  },
                ),
              );
            },
          ),
          ProfileMenu(
            text: "Help Center",
            image: "assets/images/barista.png",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            image: "assets/images/paper-cup.png",
            press: () {
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
        ],
      ),
    );
  }
}

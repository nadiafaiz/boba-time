import 'package:boba_time/screens/Profile/setting_screen.dart';
import 'package:boba_time/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'profile_menu.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Image.asset(
            'assets/images/default_profile.png',
            height: 130,
          ),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "My Reward",
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
            text: "Password Setting",
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
            press: () {
              _calling();
            },
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

  void _calling(){
    _launchURL();
  }
  _launchURL() async {
    const url = 'tel:4044132000';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}


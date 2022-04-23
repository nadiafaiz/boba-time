import 'package:boba_time/screens/landing_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../screens/Profile/profile_screen.dart';

class NavBar extends StatelessWidget {
  final String? fullName;
  final String? email;
  const NavBar({Key? key, required this.fullName, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(fullName ?? 'Welcome!'),
            accountEmail: Text(email ?? 'Please consider creating an account'),
            currentAccountPicture: const CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage('assets/images/default_profile.png'),
              backgroundColor: Colors.transparent,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/boba_tile.png',
                ),
              ),
            ),
          ),
          if (fullName != null || email != null)
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()),
                )
              },
            ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share with a friend'),
            onTap: () => {
              Share.shareWithResult(
                  'Check out our Github https://github.com/nadiafaiz/boba_time'),
            },
          ),
          const Divider(),
          fullName != null && email != null
              ? ListTile(
                  title: const Text('Logout'),
                  leading: const Icon(Icons.exit_to_app),
                  onTap: () => {
                    _showConfirmLogoutDialog(context),
                  },
                )
              : ListTile(
                  title: const Text('Go back'),
                  leading: const Icon(Icons.exit_to_app),
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LandingScreen(),
                      ),
                    )
                  },
                ),
        ],
      ),
    );
  }

  Future<void> _showConfirmLogoutDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmation"),
          content: SingleChildScrollView(
            child: Column(
              children: const <Widget>[
                Text("Are you sure you want to logout?"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Yes"),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LandingScreen(),
                  ),
                );
              },
            ),
            TextButton(
              child: const Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

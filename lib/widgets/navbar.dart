import 'package:boba_time/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../screens/Profile/profile_screen.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            // Update this with Firebase user
            accountName: Text('username'),
            accountEmail: Text('username@gmail.com'),
            currentAccountPicture: CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage('assets/images/default_profile.png'),
              backgroundColor: Colors.transparent,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/boba_tile.png',
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            // Update this to navigate to profile screen
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
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
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.exit_to_app),
            // Update this to log out user
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LandingScreen()),
              ),
            },
          ),
        ],
      ),
    );
  }
}

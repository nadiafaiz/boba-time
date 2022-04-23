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
          UserAccountsDrawerHeader(
            // Update this with Firebase user
            accountName: const Text('username'),
            accountEmail: const Text('username@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/default_profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
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
                MaterialPageRoute( builder: (context) => ProfileScreen()),
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

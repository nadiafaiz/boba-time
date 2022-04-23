import 'package:flutter/material.dart';
import 'package:boba_time/screens/screens.dart';
import 'package:boba_time/widgets/widgets.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Image(
              image: AssetImage(
                'assets/images/boba_time.png',
              ),
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Spacer(flex: 15),
                  const Spacer(flex: 1),
                  SizedBox(
                    width: double.maxFinite,
                    child: AppButtons.mainButton(
                      'SIGN IN | SIGN UP',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const LoginScreen();
                            },
                          ),
                        );
                      },
                      buttonColor: const Color(0xff603a22),
                      textColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.maxFinite,
                    child: AppButtons.mainButton(
                      'LOCATIONS',
                      onPressed: () {
                        _openLocations(context);
                      },
                      buttonColor: const Color(0xff603a22),
                      textColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.maxFinite,
                    child: AppButtons.mainButton(
                      'CONTINUE AS GUEST',
                      onPressed: () {
                        _continueAsGuest(context);
                      },
                      buttonColor: const Color(0xff603a22),
                      textColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _continueAsGuest(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(
          isGuest: true,
        ),
      ),
    );
  }

  void _openLocations(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LocationScreen(),
      ),
    );
  }
}

import 'package:boba_time/screens/Reward/components/progress_bar.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return SingleChildScrollView(
    //   padding: const EdgeInsets.symmetric(vertical: 20),
    //   child: Column(
    //     children: const [
    //       SizedBox(height: 20),
    //       (),
    //     ],
    //   ),
    // );
    return const CircularProgressIndicatorApp();
  }

}

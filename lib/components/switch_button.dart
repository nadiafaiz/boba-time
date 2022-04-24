import 'package:flutter/material.dart';

class MySwitchButton extends StatefulWidget {
  const MySwitchButton({Key? key}) : super(key: key);

  @override
  SwitchButton createState() => SwitchButton();
}

class SwitchButton extends State<MySwitchButton> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: (value) {
        isSwitched = value;
      },
      activeTrackColor: const Color(0xffC1F4C5),
      activeColor: const Color(0xff65C18C),
    );
  }
}

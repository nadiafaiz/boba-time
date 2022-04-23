import 'package:boba_time/components/text_field_container.dart';
import 'package:boba_time/constants.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final String? Function(String?)? validator;
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _showPassword = false;

  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: !_showPassword,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: "Password",
          icon: const Icon(
            Icons.lock,
            color: primaryColor,
          ),
          suffixIcon: InkWell(
            child: const Icon(
              Icons.visibility,
              color: primaryColor,
            ),
            onTap: () {
              _togglevisibility();
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

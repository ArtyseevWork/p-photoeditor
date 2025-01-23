import 'package:flutter/material.dart';
import 'package:pphotoeditor/screens/login/login_layout.dart';
import 'package:pphotoeditor/values/colors.dart';

class KeyButton extends StatelessWidget {
  final String char;
  final VoidCallback onPressed;

  const KeyButton({required this.char, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: clrBlack,
        backgroundColor: clrYellow,
        padding: const EdgeInsets.symmetric(vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: clrGreenDark, width: 3.0),
        ),
        textStyle: LoginLayout.textStyleKeyBoard,
      ),
      onPressed: onPressed,
      child: Text(char),
    );
  }
}

import 'package:flutter/material.dart';

var buttonTextStyle = const TextStyle(fontWeight: FontWeight.w900);

class StyledButton extends StatelessWidget {
  const StyledButton({super.key, required this.onPressed, required this.text, this.bgColor = ""});

  final void Function() onPressed;
  final String text;
  final String bgColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child:
          Text(text, style: buttonTextStyle));
  }
}
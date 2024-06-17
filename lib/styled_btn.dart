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
      style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(10)),
      onPressed: onPressed,
      child:
          Text(text, style: buttonTextStyle));
  }
}
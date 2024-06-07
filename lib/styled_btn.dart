import 'package:flutter/material.dart';

var buttonTextStyle = const TextStyle(fontWeight: FontWeight.w900);

class StyledButton extends StatelessWidget {
  const StyledButton({super.key, required this.onPressed, required this.text});

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                  onPressed: onPressed,
                  child:
                      Text(text, style: buttonTextStyle));
  }
}
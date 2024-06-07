import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  const InputBox({super.key, required this.isText, required this.hint});

  final bool isText;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: isText? TextInputType.text : TextInputType.number,  
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hint,
        isDense: true,
        contentPadding: const EdgeInsets.all(0),
      )
    );
  }
}
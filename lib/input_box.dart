import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  const InputBox({super.key, required this.isText, this.hint = "", required this.onSaved});

  final bool isText;
  final String hint;
  final void Function(String?) onSaved;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: isText? TextInputType.text : TextInputType.number,  
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        isDense: true,
        contentPadding: const EdgeInsets.all(0),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Required';
        return null;
      },
      onSaved: onSaved,
    );
  }
}
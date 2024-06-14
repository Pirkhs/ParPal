import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  const InputBox({super.key, required this.isText, this.hint = "", required this.onSaved, this.initialValue = ""});

  final bool isText;
  final String hint;
  final void Function(String?) onSaved;
  final String initialValue;

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
      initialValue: initialValue,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Required';
        if (!isText) {
          if (int.tryParse(value) == null) return 'Integer';
        }

        return null;
      },
      onSaved: onSaved,
    );
  }
}
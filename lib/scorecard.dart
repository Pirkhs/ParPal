import 'package:flutter/material.dart';

const inputBox = TextField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: "Player Name"
  )
);

class Scorecard extends StatelessWidget {
  const Scorecard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scorecard")
      ),
      body: Table(
        border: TableBorder.all(width: 1),
        children: const [
          TableRow(
            children: [
              Text("Hole"),
              inputBox,
              inputBox,
              inputBox
            ]
          )
        ]
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:parpal/input_box.dart';

class Scorecard extends StatefulWidget {
  const Scorecard({super.key});

  @override
  State<Scorecard> createState() => _ScorecardState();
}

class _ScorecardState extends State<Scorecard> {

  int players = 1;
  int holes = 18;

  void incrementPlayers() {
    setState(() {
      players = players + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scorecard")
      ),
      body: Table(
        border: TableBorder.all(width: 1),
        children: [
          TableRow(
            children: [
              const Text("Hole"),
              for (int i = 0; i < players; i++)
                const InputBox(isText: true, hint: "Name"),
              TextButton(
                onPressed: incrementPlayers,
                child: const Text("+ Player")
              )
            ],
          ),
          for (int i = 0; i < holes; i++)
            TableRow(
              children: [
                Text("$i"),

                for (int j = 0; j < players; j++)
                  const InputBox(isText: false, hint: "Score"),

                const Text("d", style: TextStyle(backgroundColor: Colors.red))
              ]
            ),
            
        ]
      )
    );
  }
}
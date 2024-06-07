import 'package:flutter/material.dart';
import 'package:parpal/input_box.dart';
import 'package:parpal/podium.dart';
import 'package:parpal/styled_btn.dart';

const scorecardTextStyle = TextStyle(color: Colors.black);

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
      body: SingleChildScrollView(
        child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Table(
              border: TableBorder.all(width: 1),
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [
                    const Text("Hole", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w900)),
                    for (int i = 0; i < players; i++)
                      const InputBox(isText: true, hint: "Name"),
                    TextButton(
                      onPressed: incrementPlayers,
                      child: const Text("+ Player", textAlign: TextAlign.center)
                    )
                  ],
                ),

                for (int i = 0; i < holes + 1; i++)
                  TableRow(
                    decoration: i % 2 == 1 ? BoxDecoration(color: Colors.grey[200]) : null,
                    children: [
                      Text("$i", textAlign: TextAlign.center),
                      
                      for (int j = 0; j < players; j++)
                        const InputBox(isText: false, hint: "Score"),
            
                      // const SizedBox.shrink(),
                      const SizedBox.shrink()
                    ]
                  ),
                  
              ]
            ),
          ),
          StyledButton(onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Podium()),
                        );
                      }, text: "End Game"),
        ],
      )
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:parpal/input_box.dart';
import 'package:parpal/podium.dart';
import 'package:parpal/styled_btn.dart';

const boldText = TextStyle(fontWeight: FontWeight.w900);

class Scorecard extends StatefulWidget {
  const Scorecard({super.key});

  @override
  State<Scorecard> createState() => _ScorecardState();
}

class _ScorecardState extends State<Scorecard> {

  final _formGlobalKey = GlobalKey<FormState>();

  int playerCount = 1;
  int holeCount = 18;
  List playerNames = [];
  List allScores = [];

  void incrementPlayers() {
    setState(() {
      playerCount = playerCount + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scorecard")
      ),
      body: 
        ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Form(
                key: _formGlobalKey,
                child: Table(
                  border: TableBorder.all(width: 1),
                  children: [
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      children: [
                        const Text("Hole", textAlign: TextAlign.center, style: boldText),
                        for (int i = 0; i < playerCount; i++)
                          InputBox(initialValue: "Nathan", isText: true, hint: "Name", onSaved: (value) {playerNames.add(value!);} ),
                        TextButton(
                          onPressed: incrementPlayers,
                          child: const Text("+ Player", textAlign: TextAlign.center)
                        )
                      ],
                    ),
                
                    for (int i = 1; i <= holeCount; i++)
                      TableRow(
                        decoration: i % 2 == 0 ? BoxDecoration(color: Colors.grey[300]) : const BoxDecoration(color: Colors.white),
                        children: [
                          Text("$i", textAlign: TextAlign.center, style: boldText),
                          
                          for (int j = 1; j <= playerCount; j++)
                            InputBox(initialValue: "2",  isText: false, onSaved: (value) { allScores.add(value); }),
                
                          const SizedBox.shrink()
                        ]
                      ),                   
                  ]
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: StyledButton(onPressed: () {
                
                if (_formGlobalKey.currentState!.validate()) {
                      
                  _formGlobalKey.currentState!.save();
                      
                  List allScoresNums = allScores.map((score) => int.parse(score)).toList();

                  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Podium(playerNames: playerNames, allScores: allScoresNums, holeCount: holeCount)),
                  );
                }
                }, text: "End Game"),
            ),
          ],
        ),
      );
  }
}

/*

const scores = {
  Nathan: [],
  Joe: [],
}

*/
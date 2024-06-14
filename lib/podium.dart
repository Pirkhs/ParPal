import 'package:flutter/material.dart';
import 'package:parpal/styled_btn.dart';

class Podium extends StatelessWidget {
  const Podium({super.key, required this.playerNames, required this.allScores, required this.holeCount});

  final List playerNames;
  final List allScores;
  final int holeCount;

  @override
  Widget build(BuildContext context) {
    int playerCount = playerNames.length;

    String leastStrokePlayers = playerNames[0];
    String highestStrokePlayers = playerNames[0];
    String leastConsistentPlayers = playerNames[0];
    String mostConsistentPlayers = playerNames[0];
    String mostHolesInOnePlayers = playerNames[0];

    int leastStroke = allScores[0];
    int highestStroke = allScores[0];
    int biggestRange = allScores[0];
    int smallestRange = allScores[0];
    int mostHolesInOne = allScores[0];


    for (int i = 1; i <= playerCount; i++){
      List currScores = allScores.sublist((i - 1) * holeCount, (i * holeCount));
      currScores.sort();
      int currLeastStroke = currScores[0];
      int currHighestStroke = currScores[currScores.length - 1];
      int currRange = currScores[currScores.length - 1] - currScores[0];
      int currHolesInOne = 0;

      for (int i = 0; i < currScores.length; i++) {
        if (currScores[i] == 1) currHolesInOne++;
      }
      print(currHolesInOne)
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Podium"),
        automaticallyImplyLeading: false,
      ),
      body: Center (
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  Column(
                    children: [ 
                      const Text("3rd Place"),

                      Container(
                      width: 90,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.brown,
                      ),
                    ),
                    ]
                  ),

                  Column(
                    children: [
                      const Text("1st Place"),

                      Container(
                        width: 90,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Colors.amberAccent,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("2nd Place"),

                      Container(
                        width: 90,
                        height: 70,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ]
              ),
            ),

            Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Lowest Stroke: $leastStrokePlayers "),
                Text("Highest Stroke: $highestStrokePlayers"),
                Text("Least Consistent: $leastConsistentPlayers"),
                Text("Most Consistent: $mostConsistentPlayers"),
                Text("Most Holes In One: $mostHolesInOnePlayers"),
              ]
            ),


            StyledButton(onPressed: () {}, text: "Save Scorecard"),

            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: StyledButton(onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                }, text: "Return Home"),
              ),
            ),

          ]
        )
      )
    );
  }
}

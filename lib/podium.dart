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


    for (int i = 1; i <= playerCount; i++){
      print(allScores.sublist((i - 1) * holeCount, (i * holeCount)));
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

            const Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Lowest Score: _____ "),
                Text("Highest Score: _____ "),
                Text("Least Consistent: _____ "),
                Text("Most Consistent: _____ "),
                Text("Most Holes In One: _____ "),
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

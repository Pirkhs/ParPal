import 'package:flutter/material.dart';
import 'package:parpal/styled_btn.dart';

class Podium extends StatelessWidget {
  const Podium(
      {super.key,
      required this.playerNames,
      required this.allScores,
      required this.holeCount});

  final List playerNames;
  final List allScores;
  final int holeCount;

  @override
  Widget build(BuildContext context) {
    int playerCount = playerNames.length;

    String thirdPlace = "N/A";
    String secondPlace = "N/A";
    String firstPlace = "N/A";

    List totals = [];

    String leastStrokePlayers = "";
    String highestStrokePlayers = "";
    String leastConsistentPlayers = "";
    String mostConsistentPlayers = "";
    String mostHolesInOnePlayers = "";

    int leastStroke = allScores[0];
    int highestStroke = allScores[0];
    int biggestRange = -1;
    int smallestRange = (allScores[0] + 1) * 100;
    int mostHolesInOne = 0;

    String checkEqualStat(players, currStat, statToBeat, i) {
      return players = currStat == statToBeat
          ? "$players ${players == "" ? "" : "\n"} ${playerNames[i - 1]}"
          : players;
    }

    int add (a, b) {
      return a + b;
    }

    for (int i = 1; i <= playerCount; i++) {
      List currScores = allScores.sublist((i - 1) * holeCount, (i * holeCount));
      currScores.sort();

      int currTotal = currScores.reduce((a, b) => add(a,b));
      totals.add("${playerNames[i - 1]}:$currTotal");

      int currLeastStroke = currScores[0];
      leastStrokePlayers =
          checkEqualStat(leastStrokePlayers, currLeastStroke, leastStroke, i);
      if (currLeastStroke < leastStroke) {
        leastStrokePlayers = playerNames[i - 1];
        leastStroke = currLeastStroke;
      }

      int currHighestStroke = currScores[currScores.length - 1];
      highestStrokePlayers = checkEqualStat(
          highestStrokePlayers, currHighestStroke, highestStroke, i);
      if (currHighestStroke > highestStroke) {
        highestStrokePlayers = playerNames[i - 1];
        highestStroke = currHighestStroke;
      }

      int currRange = currScores[currScores.length - 1] - currScores[0];
      leastConsistentPlayers =
          checkEqualStat(leastConsistentPlayers, currRange, biggestRange, i);
      if (currRange > biggestRange) {
        leastConsistentPlayers = playerNames[i - 1];
        biggestRange = currRange;
      }

      mostConsistentPlayers =
          checkEqualStat(mostConsistentPlayers, currRange, smallestRange, i);
      if (currRange < smallestRange) {
        mostConsistentPlayers = playerNames[i - 1];
        smallestRange = currRange;
      }

      int currHolesInOne = 0;
      for (int i = 0; i < currScores.length; i++) {
        if (currScores[i] == 1) currHolesInOne++;
      }
      mostHolesInOnePlayers = checkEqualStat(
          mostHolesInOnePlayers, currHolesInOne, mostHolesInOne, i);
      if (currHolesInOne > mostHolesInOne) {
        mostHolesInOnePlayers = playerNames[i - 1];
        mostHolesInOne = currHolesInOne;
      }
    }

    totals.sort((a,b) => a.split(":")[1].compareTo(b.split(":")[1]));

    firstPlace = totals.isNotEmpty ? totals[0] : firstPlace;
    secondPlace = totals.length >= 2 ? totals[1] : secondPlace;
    thirdPlace = totals.length >= 3 ? totals[2] : thirdPlace;
    
    return Scaffold(
        appBar: AppBar(
          title: const Text("Podium"),
          automaticallyImplyLeading: false,
        ),
        bottomNavigationBar:       
        SafeArea(
          child: BottomAppBar(
              color: Colors.transparent,
              elevation: 0,
              child: StyledButton(onPressed: () {Navigator.popUntil(context, ModalRoute.withName('/'));}, text: "Return Home")
            ),
        ),
        body: Center(
            child: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(children: [
                      Text(thirdPlace),
                      Container(
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Colors.brown,
                        ),
                      ),
                    ]),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Text(firstPlace),
                        Container(
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Colors.amberAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Text(secondPlace),
                        Container(
                          height: 70,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
          ),
          if (playerCount > 3) 
            for (int i = 4; i <= playerCount; i++)
              Center(child: Text("${i}th: ${totals[i - 1]}")),

          Container(
            margin: const EdgeInsets.all(10),
            child: Table(border: TableBorder.all(width: 1), children: [
              TableRow(
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: const [
                    Text("Stat", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Awarded To",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Awarded For",
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ]),
              TableRow(
                  decoration: const BoxDecoration(color: Colors.white),
                  children: [
                    const Text("Least Strokes on a Hole"),
                    Text(leastStrokePlayers),
                    Text("$leastStroke Stroke(s)")
                  ]),
              TableRow(
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [
                    const Text("Most Strokes on a Hole"),
                    Text(highestStrokePlayers),
                    Text("$highestStroke Stroke(s)")
                  ]),
              TableRow(
                  decoration: const BoxDecoration(color: Colors.white),
                  children: [
                    const Text("Least Consistent"),
                    Text(leastConsistentPlayers),
                    Text("Range of $biggestRange")
                  ]),
              TableRow(
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: [
                    const Text("Most Consistent"),
                    Text(mostConsistentPlayers),
                    Text("Range of $smallestRange")
                  ]),
              TableRow(
                  decoration: const BoxDecoration(color: Colors.white),
                  children: [
                    const Text("Most Holes In One"),
                    Text((mostHolesInOne == 0 ? "N/A" : mostHolesInOnePlayers)),
                    Text("$mostHolesInOne Holes in One")
                  ]),
            ]),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: StyledButton(onPressed: () {
              var now = DateTime.now();
              print([now.day, now.month, now.year].join("/"));
            }, text: "Save Scorecard")),
        ])));
  }
}

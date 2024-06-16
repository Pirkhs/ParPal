import 'package:flutter/material.dart';
import 'package:parpal/saved_scorecards.dart';
import 'package:parpal/scorecard.dart';
import 'package:parpal/styled_btn.dart';

var appBarTitleDecoration = RichText(
    text: const TextSpan(
      style: TextStyle(fontSize: 40),
      children: [
        TextSpan(text: "Par", style: TextStyle(color: Colors.green)),
        TextSpan(text: "Pal ", style: TextStyle(color: Colors.black)),
        WidgetSpan( child: Icon(Icons.golf_course, size: 50, semanticLabel: "Black golf course icon",)),
      ],
));

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: appBarTitleDecoration,
          centerTitle: true,
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              Container(
                  margin: const EdgeInsets.all(10),
                  child: StyledButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Scorecard()),
                        );
                      },
                      text: "Start New Game"
                  )
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: StyledButton(onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SavedScorecards()),
                        );
                }, text: "View Saved Scorecards")
              )
            ])));
  }
}


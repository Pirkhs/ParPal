import 'package:flutter/material.dart';
// import 'package:parpal/create_scorecard.dart';
import 'package:parpal/scorecard.dart';

var appBarTitleDecoration = RichText(
    text: const TextSpan(
  style: TextStyle(fontSize: 40),
  children: <TextSpan>[
    TextSpan(text: "Par", style: TextStyle(color: Colors.green)),
    TextSpan(text: "Pal ", style: TextStyle(color: Colors.black)),
    TextSpan(text: "⛳")
  ],
));

var buttonTextStyle = const TextStyle(fontWeight: FontWeight.w900);

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
                  margin: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Scorecard()),
                        );
                      },
                      child: Text("Start a New Game", style: buttonTextStyle))),
              Container(
                margin: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: ElevatedButton(
                    onPressed: () {},
                    child:
                        Text("View Saved Scorecards", style: buttonTextStyle)),
              )
            ])));
  }
}

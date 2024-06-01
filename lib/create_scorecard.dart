import 'package:flutter/material.dart';

class CreateScorecard extends StatelessWidget {
  const CreateScorecard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Create Scorecard")),

        body: Center(
          child: Container(
            color: Colors.green,
            padding: const EdgeInsets.all(5),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                    ),
                  )
                ]
              )
            )
          )
        )
    );
  }
}

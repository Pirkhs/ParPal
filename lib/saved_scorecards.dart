import 'package:flutter/material.dart';
import 'package:parpal/database_helper.dart';
import 'package:parpal/scorecard_data.dart';

class SavedScorecards extends StatelessWidget {
  const SavedScorecards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Scorecards"),
      ),
      body: Center(
        child: FutureBuilder<List<ScorecardData>>(
          future: DatabaseHelper.instance.getScorecards(),
          builder: (BuildContext context, AsyncSnapshot<List<ScorecardData>> snapshot) {
            print(snapshot);
            if (!snapshot.hasData) { return const Center(child: Text("Loading...")); }
            return snapshot.data!.isEmpty
              ? const Center(child: Text("No Saved Scorecards"))
              : const Text("Scorecards");
          }
        ),
      )

    );
  }
}
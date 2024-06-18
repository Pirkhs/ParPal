import 'package:flutter/material.dart';
import 'package:parpal/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ParPal',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.green,
          appBarTheme: const AppBarTheme(
            color: Colors.white,
          )
          ),
        home: const Home()
        );
  }
}

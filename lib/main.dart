import 'package:flutter/material.dart';
import 'package:parpal/home.dart';

const gradientGreen = BoxDecoration(
    gradient: LinearGradient(colors: [Colors.green, Colors.lightGreenAccent]));

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ParPal',
        theme: ThemeData(scaffoldBackgroundColor: Colors.transparent),
        home: Container(decoration: gradientGreen, child: const Home())
        );
  }
}

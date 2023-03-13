import 'package:flutter/material.dart';
import 'package:u2t1_19600608_marcolopez/tarea1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarea1',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Tarea1(),
    );
  }
}

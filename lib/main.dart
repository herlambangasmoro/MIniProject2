import 'package:flutter/material.dart';
import 'package:miniproject2/pages/bloc_provider.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: const BlocProvider17() ,
    );
  }
}

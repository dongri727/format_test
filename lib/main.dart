import 'package:flutter/material.dart';

import 'insert_page.dart';
import 'try_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MySQL Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const InsertPage(title: '',),
    );
  }
}
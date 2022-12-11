import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

var testText = "test!";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('AlertDialog Sample')),
        body: const Center(
          child: Test(testText: "test!")
        ),
      ),
    );
  }
}

class Test extends StatelessWidget {
  const Test({Key? key, this.testText}) : super(key: key);
  final testText;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Text("state 전달 테스트"),
          Text(testText.toString()),
        ],
    );
  }
}

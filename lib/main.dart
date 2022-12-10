import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("과제3"),
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            People(),
            People(),
            People(),
            People(),
            People(),
            People(),
            People(),
            People(),
            People(),
            People(),
            People(),
            People(),
            People(),
            People(),
            People(),
            People(),
            People(),
            People(),
            People(),
            People(),
            People(),
            People(),
            People(),
            People(),
            People(),
            People(),
            People(),
            People(),
            People(),
            People(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: BottomBar(),
        ),
      ),
    );
  }
}

class People extends StatelessWidget {
  const People({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.people),
        Text("한지선"),
      ],
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.call),
          Icon(Icons.message),
          Icon(Icons.mail),
        ],
      ),
    );
  }
}

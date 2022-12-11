import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

var likeNum = [0, 0, 0];
var name = ["지선1", "지선2", "지선3"];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("과제3"),
            ),
            body: Like()
        )
    );
  }
}

class Like extends StatefulWidget {
  const Like({Key? key}) : super(key: key);

  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (c, i) {
          return ListTile(
            leading: Text(likeNum[i].toString()),
            title: Text(name[i]),
            trailing: TextButton(
              child: Text("좋아요"),
              onPressed: () {
                setState(() {
                  likeNum[i]++;
                });
              },
            ),
          );
        }
    );
  }
}



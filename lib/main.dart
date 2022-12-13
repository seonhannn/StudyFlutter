import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp()
    )
  );
}

List<String> people = ["p1", "p2", "p3"];
var likeNum = [0, 0, 0];
var inputName = '';
var peopleNum = 3;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController inputController = TextEditingController();

  addPeople(name) {
    setState(() {
      people.add(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(people.length.toString()),
      ),
      body: Container(
        height: 600,
        child: PeopleList(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            showDialog(
                context: context,
                builder: (BuildContext context){
                  return AlertDialog(
                    title: Text("add people"),
                    content: TextField(
                      controller: inputController,
                      decoration: InputDecoration(
                        hintText: "이름을 입력하세요."
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: (){
                            setState(() {
                              inputName = inputController.text;
                              addPeople(inputName);
                              peopleNum++;
                              likeNum.add(0);
                              Navigator.of(context).pop();
                            });
                          },
                          child: Text("Add")
                      ),
                      TextButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          child: Text("Cancel")
                      )
                    ],
                  );
                }
            );
          },
        ),
      ),
    );
  }
}

class PeopleList extends StatefulWidget {
  const PeopleList({Key? key}) : super(key: key);

  @override
  State<PeopleList> createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder (
        itemCount: peopleNum,
        itemBuilder: (c, i){
          return (
              ListTile(
                  leading: Text(likeNum[i].toString()),
                  title: Text(people[i]),
                  trailing: TextButton(
                    child: Text("좋아요"),
                    onPressed: (){
                      setState(() {
                        likeNum[i]++;
                      });
                    },
                  )
              )
          );
        }
    );
  }
}

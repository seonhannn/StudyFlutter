import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp()
    )
  );
}

var people = [];
var likeNum = [0];
var inputName = '';
var peopleNum = 1;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print('허락됨');
      var contacts = await ContactsService.getContacts();
      print(contacts);
      setState(() {
        people = contacts;
        likeNum.add(0);
      });
    } else if (status.isDenied) {
      print('거절됨');
      Permission.contacts.request();
      openAppSettings();
    }
  }

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
        actions: [
          IconButton(
            onPressed: (){getPermission();},
            icon: Icon(Icons.contacts))
        ],
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
                  title: Row(
                    children: [
                      Icon(Icons.people),
                      SizedBox(
                        width: 40,
                      ),
                      Text(people[i].displayName)
                    ],
                  ),
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

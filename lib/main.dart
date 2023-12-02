/* 
Author: Muhammad Afiq
Date: 19 Nov 2023
Purpose: To create a simple To-Do List app by applying showDialogBox widget and ListView.builder
*/

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: MyMainPage(),
    theme: ThemeData(
      primarySwatch: Colors.purple,
      splashColor: Colors.amber,
    )));

class MyMainPage extends StatefulWidget {
  const MyMainPage({Key? key}) : super(key: key);

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  List<String> _todoRecords = ["Task 1", "Task 2", "Task 3", "Task 4"];

  void _adddingToDO() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String newToDo = "";

          return AlertDialog(
            title: const Text("Enter New Task Below:"),
            content: TextField(
              onChanged: (value) {
                newToDo = value;
              },
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _todoRecords.add(newToDo);
                  });
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'To Do List',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: _todoRecords.length,
              itemBuilder: (context, index) {
                final toDo = _todoRecords[index];

                return Container(
                  color: Colors.amber[100],
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          toDo,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.remove_circle_outline,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              _todoRecords.removeAt(index);
                            });
                          },
                        ),
                      ),
                      Divider(
                        thickness: 2.0,
                      ),
                    ],
                  ),
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _adddingToDO,
        ));
  }
}

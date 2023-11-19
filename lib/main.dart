/* 
Author: Muhammad Afiq
Date: 19 Nov 2023
Purpose: To create a simple To-Do List app by applyiing showDialogBox widget and ListView.builder
*/

import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyMainPage()));

class MyMainPage extends StatefulWidget {
  const MyMainPage({super.key});

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
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _todoRecords.add(newToDo);
                  });
                  Navigator.of(context).pop();
                },
                child: const Text("Submit"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('To Do List'),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: _todoRecords.length,
            itemBuilder: (context, index) {
              final toDo = _todoRecords[index];

              return ListTile(
                title: Text(toDo),
                onTap: () {
                  setState(() {
                    _todoRecords.removeAt(index);
                  });
                },
              );
            }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _adddingToDO,
        ));
  }
}

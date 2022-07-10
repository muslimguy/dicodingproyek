import 'dart:ffi';

import 'package:dicodingproyek/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Todo());
}

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List<String> _todoList = <String>[];
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () => _displayDialog(context),
            tooltip: 'Add Item',
            child: Icon(Icons.add)),
        body: SafeArea(
          child: Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      height: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(40.0),
                        ),
                        color: Colors.green[200],
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30.0,
                          ),
                          SizedBox(
                            height: 80.0,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HalamanUtama()));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.arrow_back),
                                  Text("Go Back")
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "Simple Todo App",
                            style: TextStyle(
                              fontSize: 30.0,
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(child: ListView(children: _getItems())),
                ]),
          ),
        ),
      ),
    );
  }

  void _addTodoItem(String title) {
    //  a set state will notify the app that the state has changed
    setState(() {
      _todoList.add(title);
    });
    _textFieldController.clear();
  }

  Widget _buildTodoItem(String title) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 30.0),
      ),
    );
  }

  // display a dialog for the user to enter items
  Future<Future> _displayDialog(BuildContext context) async {
    // alter the app state to show a dialog
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add a task to your list'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: 'Enter task here'),
            ),
            actions: <Widget>[
              // add button
              ElevatedButton(
                child: const Text('ADD'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addTodoItem(_textFieldController.text);
                },
              ),
              // cancel button
              ElevatedButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  // iterates through our todo list titles.
  List<Widget> _getItems() {
    final List<Widget> _todoWidgets = <Widget>[];
    for (String title in _todoList) {
      _todoWidgets.add(_buildTodoItem(title));
    }
    return _todoWidgets;
  }
}

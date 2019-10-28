import 'package:flutter/material.dart';

import 'package:practice_2/widgets/task_cell.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final TextEditingController _textFieldController = TextEditingController();
  final _list = <String>['Read lection', 'Think about it', 'Do homework'];

  void dismissAlert(BuildContext context) {
    Navigator.of(context).pop();
    _textFieldController.clear();
  }

  void _addNewItem(BuildContext context) {
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add new tasks'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: 'Task description'),
            ),
            actions: <Widget>[
              FlatButton(
                textTheme: ButtonTextTheme.normal,
                child: const Text(
                  'Cancel',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                onPressed: () => dismissAlert(context),
              ),
              FlatButton(
                textTheme: ButtonTextTheme.accent,
                child: const Text(
                  'Add',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                onPressed: () {
                  setState(() {
                    if (_textFieldController.text.isNotEmpty) {
                      _list.add(_textFieldController.text);
                    }
                  });
                  dismissAlert(context);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Active tasks')),
      body: ListView.separated(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return TaskCell(
            title: _list[index],
            onPressed: () {
              setState(() => _list.removeAt(index));
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewItem(context),
        child: Icon(Icons.add),
        tooltip: 'Add',
      ),
    );
  }
}

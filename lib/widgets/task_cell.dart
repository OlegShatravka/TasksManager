import 'package:flutter/material.dart';

class TaskCell extends StatelessWidget {
  const TaskCell({this.title, this.onPressed});

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(25, 10, 20, 10),
        child: Row(children: <Widget>[
          Expanded(child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400 ),), flex: 1),
          RaisedButton(
            onPressed: onPressed,
            child: const Text('Did it!', style: TextStyle(fontSize: 18)),
          ),
        ]));
  }
}

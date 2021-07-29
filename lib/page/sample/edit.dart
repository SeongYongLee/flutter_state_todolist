import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutter_state_todolist/model/todo.dart';
import 'package:flutter_state_todolist/component/todo_edit.dart';

class InheritedWidgetEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Todo todo = new Todo(1, DateTime.now());
    final index = int.parse(context.vRouter.pathParameters['index'] as String);

    // TODO : init todo
    // if (index != -1) {
    // } else {
    // }

    return TodoEdit(
        name: "InheritedWidget", route: 'widget', todo: todo, index: -1);
  }
}

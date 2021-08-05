import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutter_state_todolist/model/todo.dart';
import 'package:flutter_state_todolist/component/todo_edit.dart';
import 'package:flutter_state_todolist/state/inherited_widget/todo.dart';

class InheritedWidgetEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final index = int.parse(context.vRouter.pathParameters['index'] ?? '-1');
    final TodoInheritedWidgetState state = TodoInheritedWidget.of(context);

    void onSave(int index, Todo todo) {
      if (index == -1) {
        state.addItem(todo);
      } else {
        state.setItem(index, todo);
      }
      return;
    }

    return TodoEdit(
        name: "InheritedWidget",
        route: 'widget',
        todo: index == -1
            ? Todo(state.itemsCount, DateTime.now())
            : state.getItem(index),
        index: index,
        onSave: onSave);
  }
}

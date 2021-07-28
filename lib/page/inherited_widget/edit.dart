import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutter_state_todolist/model/todo.dart';
import 'package:flutter_state_todolist/component/todo_edit_card.dart';

class InheritedWidgetEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Todo todo = new Todo(1, DateTime.now());
    final index = int.parse(context.vRouter.pathParameters['index'] as String);

    // TODO : init todo
    // if (index != -1) {
    // } else {
    // }

    StringBuffer title = StringBuffer(todo.title);
    StringBuffer role = StringBuffer(todo.role);
    StringBuffer goal = StringBuffer(todo.goal);
    StringBuffer value = StringBuffer(todo.value);

    onSaveTodo() {
      todo.title = title.toString();
      todo.role = role.toString();
      todo.goal = goal.toString();
      todo.value = value.toString();
      // TODO : SAVE
      // BlocProvider.of<TodoBloc>(context)..add(TodoEventSaving(todo));
      context.vRouter.to('/widget');
    }

    var appbar = AppBar(title: Text('TODOLIST (Inherited Widget) - EDIT'), actions: [
      Padding(
          padding: EdgeInsets.only(right: 20),
          child: GestureDetector(
              onTap: () {
                onSaveTodo();
              },
              child: Icon(Icons.save)))
    ]);

    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height -
              appbar.preferredSize.height * 1.5,
          child: Column(children: <Widget>[
            TodoEditCard(title: 'Title', buf: title, flex: 2),
            TodoEditCard(title: 'As a', buf: role, flex: 3),
            TodoEditCard(title: 'I want', buf: goal, flex: 3),
            TodoEditCard(title: 'So that', buf: value, flex: 3),
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutter_state_todolist/model/todo.dart';
// Widget
import 'package:flutter_state_todolist/state/inherited_widget/todo.dart';
// BLOC
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_todolist/state/bloc/todo/bloc.dart';

class TodoEdit extends StatelessWidget {
  final String name;
  final String route;
  final Todo todo;
  final int index;

  TodoEdit({Key? key, required this.name, required this.route, required this.todo, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TodoInheritedWidgetState state = TodoInheritedWidget.of(context);

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
      if (route == 'widget') {
        state.setItem(index, todo);
      } else if (route == 'bloc') {
        BlocProvider.of<TodoBloc>(context)..add(TodoEventSaving(todo));
      }
      context.vRouter.to('/$route');
    }

    var appbar = AppBar(
      title: Text('TODOLIST ($name) - EDIT'),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: () {
              onSaveTodo();
            },
            child: Icon(Icons.save),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height -
              appbar.preferredSize.height * 1.5,
          child: Column(
            children: <Widget>[
              TodoEditCard(title: 'Title', buf: title, flex: 2),
              TodoEditCard(title: 'As a', buf: role, flex: 3),
              TodoEditCard(title: 'I want', buf: goal, flex: 3),
              TodoEditCard(title: 'So that', buf: value, flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}

class TodoEditCard extends StatelessWidget {
  final String title;
  final StringBuffer buf;
  final int flex;
  late final TextEditingController _controller;

  TodoEditCard(
      {Key? key, required this.title, required this.buf, required this.flex})
      : super(key: key) {
    _controller = TextEditingController(text: buf.toString());
    _controller.addListener(() {
      buf.clear();
      buf.write(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: EdgeInsets.all(10),
        child: TextField(
          maxLines: 100,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: title,
          ),
          controller: _controller,
        ),
      ),
    );
  }
}

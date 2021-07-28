import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutter_state_todolist/state/bloc/todo/bloc.dart';
import 'package:flutter_state_todolist/model/todo.dart';
import 'package:flutter_state_todolist/component/todo_edit_card.dart';
import 'package:flutter_state_todolist/model/todo_repository.dart';

class BlocEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Todo todo;
    final index = int.parse(context.vRouter.pathParameters['index'] as String);

    if (index != -1) {
      final repository = RepositoryProvider.of<TodoRepository>(context);
      final todos = repository.getList();
      todo = todos[index];
    } else {
      todo = RepositoryProvider.of<TodoRepository>(context).getNew() as Todo;
    }

    StringBuffer title = StringBuffer(todo.title);
    StringBuffer role = StringBuffer(todo.role);
    StringBuffer goal = StringBuffer(todo.goal);
    StringBuffer value = StringBuffer(todo.value);

    onSaveTodo() {
      todo.title = title.toString();
      todo.role = role.toString();
      todo.goal = goal.toString();
      todo.value = value.toString();
      BlocProvider.of<TodoBloc>(context)..add(TodoEventSaving(todo));
      context.vRouter.to('/bloc');
    }

    var appbar = AppBar(
      title: Text('TODOLIST (BLOC) - EDIT'),
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

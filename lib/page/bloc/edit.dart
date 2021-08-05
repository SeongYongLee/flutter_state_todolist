import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutter_state_todolist/model/todo.dart';
import 'package:flutter_state_todolist/component/todo_edit.dart';
import 'package:flutter_state_todolist/state/bloc/todo/bloc.dart';
import 'package:flutter_state_todolist/model/todo_repository.dart';

class BlocEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final index = int.parse(context.vRouter.pathParameters['index'] ?? '-1');
    final repository = RepositoryProvider.of<TodoRepository>(context);
    final todos = repository.getList();

    void onSave(int index, Todo todo) {
      if (index == -1) {
        repository.create(todo);
      } else {
        BlocProvider.of<TodoBloc>(context)..add(TodoEventSaving(todo));
      }

      return;
    }

    return TodoEdit(
        name: "BLOC",
        route: 'bloc',
        todo: index == -1 ? Todo(todos.length, DateTime.now()) : todos[index],
        index: index,
        onSave: onSave);
  }
}

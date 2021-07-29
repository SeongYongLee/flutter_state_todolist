import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutter_state_todolist/model/todo.dart';
import 'package:flutter_state_todolist/component/todo_edit.dart';
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

    return TodoEdit(name: "BLOC", route: 'bloc', todo: todo, index: -1);
  }
}

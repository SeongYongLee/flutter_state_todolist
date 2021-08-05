import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutter_state_todolist/state/bloc/todo/bloc.dart';
import 'package:flutter_state_todolist/state/bloc/todo/event.dart';
import 'package:flutter_state_todolist/model/todo_repository.dart';

export 'list.dart';
export 'edit.dart';

class BlocWidgetBuilder extends StatelessWidget {
  final Widget child;

  const BlocWidgetBuilder(this.child);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => TodoRepository(),
      child: BlocProvider(
        create: (context) =>
            TodoBloc(RepositoryProvider.of<TodoRepository>(context))
              ..add(TodoEventFetching()),
        child: VMaterialApp(
          title: 'TODOLIST (BLOC)',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          child: child,
        ),
      ),
    );
  }
}

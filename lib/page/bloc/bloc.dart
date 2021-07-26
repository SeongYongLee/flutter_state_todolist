import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_state_todolist/state/bloc/todo/bloc.dart';
import 'package:flutter_state_todolist/state/bloc/todo/event.dart';
import 'package:flutter_state_todolist/model/todo_repository.dart';

import 'edit.dart';
import 'list.dart';

class BlocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => TodoRepository(),
      child: BlocProvider(
        create: (context) => TodoBloc(RepositoryProvider.of<TodoRepository>(context))
          ..add(TodoEventFetching()),
        child: MaterialApp(
          title: 'TODOLIST (BLOC)',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/bloc',
          routes: {
            '/bloc': (context) => BlocListPage(),
            '/bloc/edit': (context) => BlocEditPage(),
          },
        ),
      ),
    );
  }
}
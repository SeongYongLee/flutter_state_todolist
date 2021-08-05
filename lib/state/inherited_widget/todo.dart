import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_state_todolist/model/todo.dart';

class TodoInherited extends InheritedWidget {
  final Widget child;
  final TodoController todos;

  TodoInherited({Key? key, required this.todos, required this.child})
      : super(key: key, child: child);

  static TodoController? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TodoInherited>()!.todos;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}

class TodoController {
  final controller = StreamController<List<Todo>>.broadcast();
  List<Todo> state = <Todo>[];

  delete(int index) {
    if (state.length > index) {
      state.removeAt(index);
      controller.add(state);
    }
  }

  add(Todo todo) {
    print(todo);
    print(state.length);
    state.add(todo);
    print(state.length);
    controller.add(state);
  }

  edit(int index, Todo todo) {
    state[index] = todo;
    controller.add(state);
  }
}

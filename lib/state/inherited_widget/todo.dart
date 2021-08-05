import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_state_todolist/model/todo.dart';

class TodoInherited extends InheritedWidget {
  final Widget child;
  final todos = TodoController();

  TodoInherited({Key? key, required this.child})
      : super(key: key, child: child) {
    print('repaint inherited');
  }

  static TodoInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TodoInherited>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}

class TodoController {
  final controller = StreamController<List<Todo>>.broadcast();
  final state = <Todo>[];

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

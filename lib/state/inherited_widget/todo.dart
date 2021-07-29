import 'package:flutter/material.dart';
import 'package:flutter_state_todolist/model/todo.dart';

class _Todo extends InheritedWidget {
  final Widget child;
  final Todo todo;

  _Todo({Key? key, required this.child, required this.todo}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static Todo of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_Todo>()!.todo;
}
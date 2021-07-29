import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';
import 'package:flutter_state_todolist/model/todo.dart';

export 'list.dart';
export 'edit.dart';

class InheritedWidgetBuilder extends StatelessWidget {
  final Widget child;

  const InheritedWidgetBuilder(this.child);
  @override
  Widget build(BuildContext context) {
    return _Todo(
      todo: new Todo(1, DateTime.now()),
      child: VMaterialApp(
        title: 'TODOLIST (Inherited Widget)',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        child: child,
      ),
    );
  }
}

class _Todo extends InheritedWidget {
  final Widget child;
  final Todo todo;

  _Todo({Key? key, required this.child, required this.todo})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static Todo of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_Todo>()!.todo;
}

import 'package:flutter/material.dart';
import 'package:flutter_state_todolist/model/todo.dart';

class _TodoInherited extends InheritedWidget {
  final Widget child;
  final TodoInheritedWidgetState todo;

  _TodoInherited({Key? key, required this.child, required this.todo}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

class TodoInheritedWidget extends StatefulWidget {
  final Widget child;

  TodoInheritedWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  TodoInheritedWidgetState createState() => TodoInheritedWidgetState();

  static TodoInheritedWidgetState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_TodoInherited>() as _TodoInherited).todo;
  }
}


class TodoInheritedWidgetState extends State<TodoInheritedWidget> {
  List<Todo> _todolist = <Todo>[];

  int get itemsCount => _todolist.length;

  void addItem(int uid, DateTime created) {
    setState(() {
      _todolist.add(Todo(uid, created));
    });
  }

  Todo getItem(int index) {
    return _todolist[index];
  }

  void setItem(int index, Todo todo) {
    _todolist[index] = todo;
  }

  void deleteItem(int index) {
    setState(() {
      _todolist.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _TodoInherited(
      todo: this,
      child: widget.child,
    );
  }
}

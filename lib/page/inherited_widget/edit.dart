import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutter_state_todolist/component/todo_edit.dart';
import 'package:flutter_state_todolist/state/inherited_widget/todo.dart';

class InheritedWidgetEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodoInheritedWidgetState state = TodoInheritedWidget.of(context);
    final index = int.parse(context.vRouter.pathParameters['index'] as String);

    // TODO : init todo

    print(state);

    return TodoEdit(name: "InheritedWidget", route: 'widget', todo: state.getItem(index), index: index);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';
import 'package:flutter_state_todolist/state/inherited_widget/todo.dart';

export 'list.dart';
export 'edit.dart';

class InheritedWidgetBuilder extends StatelessWidget {
  final Widget child;

  const InheritedWidgetBuilder(this.child);
  @override
  Widget build(BuildContext context) {
    return TodoInheritedWidget(
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

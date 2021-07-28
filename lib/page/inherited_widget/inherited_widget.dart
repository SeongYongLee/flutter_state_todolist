import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

export 'list.dart';
export 'edit.dart';

class InheritedWidgetPage extends StatelessWidget {
  final Widget child;

  const InheritedWidgetPage(this.child);
  @override
  Widget build(BuildContext context) {
    return VMaterialApp(
      title: 'TODOLIST (Inherited Widget)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      child: child,
    );
  }
}
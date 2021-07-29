import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutter_state_todolist/model/todo.dart';
import 'package:flutter_state_todolist/component/todo_list_card.dart';

class InheritedWidgetListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TODOLIST (Inherited Widget)')),
      // TODO : Show List, Edit
      body: TodoListCard(todo: new Todo(1, DateTime.now()), state : 'widget'),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: () => context.vRouter.to('/widget/edit/-1'),
      ),
    );
  }
}
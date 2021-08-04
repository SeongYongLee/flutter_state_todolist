import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutter_state_todolist/model/todo.dart';
import 'package:flutter_state_todolist/component/todo_list_card.dart';
import 'package:flutter_state_todolist/state/inherited_widget/todo.dart';

class InheritedWidgetListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodoInheritedWidgetState state = TodoInheritedWidget.of(context);

    void onDelete(int index, Todo todo) {
      final TodoInheritedWidgetState state = TodoInheritedWidget.of(context);
      state.deleteItem(index);
      return;
    }

    return Scaffold(
      appBar: AppBar(title: Text('TODOLIST (Inherited Widget)')),
      // TODO : Show List, Edit
      body: ListView.builder(
        itemCount: state.itemsCount,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => context.vRouter.to('/widget/edit/$index'),
            child: TodoListCard(
                todo: state.getItem(index),
                route: 'widget',
                index: index,
                onDelete: onDelete),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: () {
          state.addItem();
          context.vRouter.to('/widget/edit/${state.itemsCount - 1}');
        },
      ),
    );
  }
}

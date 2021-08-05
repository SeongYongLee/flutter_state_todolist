import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutter_state_todolist/model/todo.dart';
import 'package:flutter_state_todolist/component/todo_list_card.dart';
import 'package:flutter_state_todolist/state/inherited_widget/todo.dart';

class InheritedWidgetListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(TodoInherited.of(context).hashCode);
    final todos = TodoInherited.of(context);
    print(todos.hashCode);
    void onDelete(int index, Todo todo) {
      todos!.delete(index);
      return;
    }

    return Scaffold(
      appBar: AppBar(title: Text('TODOLIST (Inherited Widget)')),
      body: ListView.builder(
        itemCount: todos!.state.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => context.vRouter.to('edit/$index'),
            child: TodoListCard(
                todo: todos.state[index],
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
          context.vRouter.to('new');
        },
      ),
    );
  }
}

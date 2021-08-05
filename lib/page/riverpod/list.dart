import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutter_state_todolist/model/todo.dart';
import 'package:flutter_state_todolist/state/riverpod/todo.dart';
import 'package:flutter_state_todolist/component/todo_list_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RiverpodListPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);

    void onDelete(int index, Todo todo) {
      ref.read(todoListProvider.notifier).remove(todo);
      return;
    }

    return Scaffold(
      appBar: AppBar(title: Text('TODOLIST (RiverPod)')),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => context.vRouter.to('/edit/$index'),
            child: TodoListCard(
                todo: todos[index],
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

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
    print(todos);

    return Scaffold(
      appBar: AppBar(title: Text('TODOLIST (RiverPod)')),
      // TODO : Show List, Edit
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => context.vRouter.to('/riverpod/edit/$index'),
            child:
                TodoListCard(todo: todos[index], route: 'widget', index: index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: () {
          ref.read(todoListProvider.notifier).add();
          context.vRouter.to('/riverpod/edit/${todos.length - 1}');
        },
      ),
    );
  }
}

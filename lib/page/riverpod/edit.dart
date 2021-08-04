import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutter_state_todolist/model/todo.dart';
import 'package:flutter_state_todolist/state/riverpod/todo.dart';
import 'package:flutter_state_todolist/component/todo_edit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RiverpodEditPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);
    final index = int.parse(context.vRouter.pathParameters['index'] as String);
    print(todos);

    void onSave(int index, Todo todo) {
      ref.read(todoListProvider.notifier).set(index, todo);
      return;
    }

    return TodoEdit(
        name: "RiverPod", route: 'riverpod', todo: todos[index], index: index, onSave: onSave);
  }
}

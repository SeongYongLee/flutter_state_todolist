import 'package:flutter_state_todolist/model/todo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoList extends StateNotifier<List<Todo>> {
  TodoList([List<Todo>? initialTodos]) : super(initialTodos ?? []);

  void add(Todo todo) {
    state.add(todo);
  }

  void set(int index, Todo todo) {
    state[index] = todo;
  }

  void remove(Todo todo) {
    state = state.where((s) => s.uid != todo.uid).toList();
  }
}

final todoListProvider =
    StateNotifierProvider<TodoList, List<Todo>>((ref) => TodoList([]));

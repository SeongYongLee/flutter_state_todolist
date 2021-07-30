import 'package:flutter_state_todolist/model/todo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoList extends StateNotifier<List<Todo>> {
  TodoList([List<Todo>? initialTodos]) : super(initialTodos ?? []);

  void add() {
    state.add(Todo(state.length, DateTime.now()));
  }

  void set(int index, Todo todo) {
    state[index] = todo;
  }

  void remove(int index) {
    state.removeAt(index);
  }
}

final todoListProvider = StateNotifierProvider<TodoList, List<Todo>>((ref) => TodoList([]));
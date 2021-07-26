import 'package:shared_preferences/shared_preferences.dart';
import 'todo.dart';

class TodoRepository {
  static const _key = "Todo";
  Map<int, Todo> _todos = Map<int, Todo>();
  int lastId = Todo.newId;

  List<Todo> getList() {
    return _todos.values.toList();
  }

  Todo? getNew() {
    lastId += 1;
    _todos[lastId] = Todo(lastId, DateTime.now());
    return _todos[lastId];
  }

  Todo? get(int uid) {
    return _todos[uid];
  }

  void set(Todo todo) {
    _todos[todo.uid] = todo;
  }

  void delete(int uid) {
    _todos.remove(uid);
  }

  Future<void> fetch() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final data = pref.getStringList(_key);
    data?.forEach((element) {
      final todo = Todo.fromJson(element);
      set(todo);
      lastId = (todo.uid > lastId) ? todo.uid : lastId;
    });
  }

  Future<void> save() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var data = <String>[];
    _todos.forEach((key, value) {
      data.add(value.toJson());
    });
    await pref.setStringList(_key, data);
  }
}

import 'dart:convert';

class Todo {
  static const newId = -1;
  final int uid;
  String title;
  String role;
  String goal;
  String value;
  DateTime created;

  Todo(this.uid, this.created,
      {this.title = "", this.role = "", this.goal = "", this.value = ""});

  static Todo fromJson(String json) {
    Map<String, dynamic> data = jsonDecode(json);
    Todo todo;
    todo = Todo(data['uid'], DateTime.parse(data['created']));
    todo.title = data['title'];
    todo.role = data['role'];
    todo.goal = data['goal'];
    todo.value = data['value'];
    return todo;
  }

  String toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['uid'] = uid;
    data['title'] = title;
    data['role'] = role;
    data['goal'] = goal;
    data['value'] = value;
    data['created'] = created.toString();
    return jsonEncode(data);
  }
}

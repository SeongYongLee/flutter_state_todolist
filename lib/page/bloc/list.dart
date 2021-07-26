import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:flutter_state_todolist/state/bloc/todo/bloc.dart';
import 'package:flutter_state_todolist/model/todo.dart';
import 'package:flutter_state_todolist/model/todo_repository.dart';
import 'package:flutter_state_todolist/component/todo_list_card_short.dart';

class BlocListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TODOLIST (BLOC)')),
      body: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
        if (state is TodoStateNotInitialized)
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Center(child: CircularProgressIndicator())],
          );
        else if (state is TodoStateFetched) {
          final repository = RepositoryProvider.of<TodoRepository>(context);
          final todos = repository.getList();
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/bloc/edit',
                        arguments: todos[index]);
                  },
                  child: TodoCard(todo: todos[index]));
            },
          );
        }
        throw '';
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.pushNamed(context, '/bloc/edit', arguments: RepositoryProvider.of<TodoRepository>(context).getNew());
        },
      ),
    );
  }
}

class TodoCard extends StatelessWidget {
  final Todo todo;

  TodoCard({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.0),
            borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.fromLTRB(10, 15, 10, 10),
        child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: Text(todo.uid.toString() + '. ' + todo.title,
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic))),
                      Text(DateFormat('yyyy-MM-dd').format(todo.created),
                          style: TextStyle(fontStyle: FontStyle.italic)),
                      PopupMenuButton(
                          onSelected: (select) {
                            BlocProvider.of<TodoBloc>(context)
                              ..add(TodoEventDeleting(todo));
                          },
                          itemBuilder: (context) => <PopupMenuEntry>[
                                const PopupMenuItem(
                                    value: 0, child: Text('delete'))
                              ])
                    ]),
                TodoListCardShort(
                    title: 'As a ', titleColor: Colors.red, text: todo.role),
                TodoListCardShort(
                    title: 'I want ',
                    titleColor: Colors.green,
                    text: todo.goal),
                TodoListCardShort(
                    title: 'So that ',
                    titleColor: Colors.blue,
                    text: todo.value)
              ],
            )));
  }
}


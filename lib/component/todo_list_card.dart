import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:flutter_state_todolist/model/todo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_todolist/state/bloc/todo/bloc.dart';

class TodoListCard extends StatelessWidget {
  final Todo todo;
  final String state;

  TodoListCard({Key? key, required this.todo, required this.state}) : super(key: key);

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
                        // TODO : DELETE
                        if (state == 'bloc') {
                          BlocProvider.of<TodoBloc>(context)
                            ..add(TodoEventDeleting(todo));
                        }
                      },
                      itemBuilder: (context) => <PopupMenuEntry>[
                        const PopupMenuItem(value: 0, child: Text('delete'))
                      ])
                ]),
            TodoListCardShort(
                title: 'As a ', titleColor: Colors.red, text: todo.role),
            TodoListCardShort(
                title: 'I want ', titleColor: Colors.green, text: todo.goal),
            TodoListCardShort(
                title: 'So that ', titleColor: Colors.blue, text: todo.value)
          ],
        ),
      ),
    );
  }
}

class TodoListCardShort extends StatelessWidget {
  final title;
  final titleColor;
  final text;

  const TodoListCardShort(
      {Key? key, this.title, this.titleColor, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: titleColor)),
        Expanded(
            child: Text(text,
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: TextStyle(color: Colors.blueGrey))),
      ],
    );
  }
}

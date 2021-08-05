import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutter_state_todolist/model/todo.dart';
import 'package:flutter_state_todolist/state/bloc/todo/bloc.dart';
import 'package:flutter_state_todolist/model/todo_repository.dart';
import 'package:flutter_state_todolist/component/todo_list_card.dart';

class BlocListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void onDelete(int index, Todo todo) {
      BlocProvider.of<TodoBloc>(context)..add(TodoEventDeleting(todo));
      return;
    }

    return Scaffold(
      appBar: AppBar(title: Text('TODOLIST (BLOC)')),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoStateFetched) {
            final repository = RepositoryProvider.of<TodoRepository>(context);
            final todos = repository.getList();
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => context.vRouter.to('/edit/$index'),
                  child: TodoListCard(
                    todo: todos[index],
                    route: 'bloc',
                    index: index,
                    onDelete: onDelete,
                  ),
                );
              },
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Center(child: CircularProgressIndicator())],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: () => context.vRouter.to('new'),
        // onPressed: () {
        //   Navigator.pushNamed(context, '/bloc/edit', arguments: RepositoryProvider.of<TodoRepository>(context).getNew());
        // },
      ),
    );
  }
}

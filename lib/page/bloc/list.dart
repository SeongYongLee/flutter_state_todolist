import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutter_state_todolist/state/bloc/todo/bloc.dart';
import 'package:flutter_state_todolist/model/todo_repository.dart';
import 'package:flutter_state_todolist/component/todo_list_card.dart';

class BlocListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    onTap: () => context.vRouter.to('/bloc/edit/$index'),
                    child: TodoListCard(todo: todos[index], state: 'bloc'));
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
        onPressed: () => context.vRouter.to('/bloc/edit/-1'),
        // onPressed: () {
        //   Navigator.pushNamed(context, '/bloc/edit', arguments: RepositoryProvider.of<TodoRepository>(context).getNew());
        // },
      ),
    );
  }
}
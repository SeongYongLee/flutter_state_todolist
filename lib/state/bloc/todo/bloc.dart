import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_todolist/model/todo_repository.dart';
import 'event.dart';
import 'state.dart';
export 'event.dart';
export 'state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository;
  TodoBloc(this.todoRepository) : super(TodoStateNotInitialized());

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is TodoEventFetching) {
      await todoRepository.fetch();
      yield TodoStateFetched();
    } else if (event is TodoEventSaving) {
      todoRepository.set(event.todo);
      await todoRepository.save();
      yield TodoStateFetched();
    } else if (event is TodoEventDeleting) {
      todoRepository.delete(event.todo.uid);
      await todoRepository.save();
      yield TodoStateFetched();
    }
  }
}

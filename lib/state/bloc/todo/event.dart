abstract class TodoEvent {
  final todo;
  TodoEvent(this.todo);
}
class TodoEventFetching extends TodoEvent{
  TodoEventFetching() : super(null);
}
class TodoEventSaving extends TodoEvent{
  TodoEventSaving(todo) : super(todo);
}
class TodoEventDeleting extends TodoEvent{
  TodoEventDeleting(todo) : super(todo);
}

abstract class NetworkEvents{}

class LoadTodosEvent extends NetworkEvents {
  List<dynamic> todos;
  LoadTodosEvent(this.todos);

}

class GetTodoEvent extends NetworkEvents{}
abstract class NetworkStates {}

class NetworkInitialState extends NetworkStates{}

class NetworkLoadingState extends NetworkStates{}

class NetworkLoadedState extends NetworkStates{
  final List<dynamic> todos;
  NetworkLoadedState(this.todos);
}

class NetworkIssueState extends NetworkStates{}
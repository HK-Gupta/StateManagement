
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_app/repository/network_repository.dart';
import 'package:state_management_app/ui/bloc_practice/manager/network/network_events.dart';
import 'package:state_management_app/ui/bloc_practice/manager/network/network_states.dart';

class NetworkBloc extends Bloc<NetworkEvents, NetworkStates> {

  final networkRepository = NetworkRepository();

  NetworkBloc() : super(NetworkInitialState()) {
    on<GetTodoEvent>((event, emit) {
      emit(NetworkLoadingState());
      try{
        networkRepository.getTodos().then((todos) {
          add(LoadTodosEvent(todos));
        });
      } catch(_) {
        emit(NetworkIssueState());
      }
    });

    on<LoadTodosEvent>((event, emit) => emit(NetworkLoadedState(event.todos)));
  }

}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_app/repository/network_repository.dart';
import 'package:state_management_app/ui/cubic_practice/manager/network_cubit/network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  NetworkCubit(): super(NetworkInitialState());
  final NetworkRepository networkRepository = NetworkRepository();

  Future<void> getTodos() async {
    emit(NetworkLoadingState());
    try{
      networkRepository.getTodos().then((todos) {
        emit(NetworkLoadedState(todos));
      });
    } catch(_) {
      emit(NetworkFailureState());
    }
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_app/repository/network_repository.dart';

final counterProvider = StateProvider.autoDispose<int>((ref) => 0);

final networkRepositoryProvider =
    StateProvider<NetworkRepository>((ref) => NetworkRepository());

final getTodosProvider = FutureProvider<List<dynamic>>((ref) {

  return ref.watch(networkRepositoryProvider).getTodos();

});
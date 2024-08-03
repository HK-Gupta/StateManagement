import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_app/ui/cubic_practice/manager/network_cubit/network_cubit.dart';
import 'package:state_management_app/ui/cubic_practice/manager/network_cubit/network_state.dart';

class CubitTodosPage extends StatelessWidget {
  const CubitTodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NetworkCubit>(context).getTodos();
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit Todos"),
      ),
      body: BlocBuilder<NetworkCubit, NetworkState> (
        builder: (context, state) {
          if(state is NetworkFailureState) {
            return const Center(
              child: Text("Something went wrong"),
            );
          } else if(state is NetworkLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if(state is NetworkLoadedState) {
            final todosData = state.todos;
            return ListView.builder(
              itemCount: todosData.length,
              itemBuilder: (context, index) {
                final todoItem = todosData[index];
                return Card(
                  color: todoItem['completed'] ?
                  Colors.green : Colors.orange,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    child: Text(
                      todoItem['title'],
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      )
    );
  }
}

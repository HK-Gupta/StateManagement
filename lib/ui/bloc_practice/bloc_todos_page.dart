import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_app/ui/bloc_practice/manager/network/network_bloc.dart';
import 'package:state_management_app/ui/bloc_practice/manager/network/network_events.dart';
import 'package:state_management_app/ui/bloc_practice/manager/network/network_states.dart';

class BlocTodosPage extends StatelessWidget {
  const BlocTodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NetworkBloc>(context).add(GetTodoEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Bloc Todos",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: BlocBuilder<NetworkBloc, NetworkStates> (
        builder: (context, state) {
          if(state is NetworkIssueState) {
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_app/ui/riverpod_practice/manager/riverpod_provider.dart';

class RiverpodTodosPage extends ConsumerWidget {
  const RiverpodTodosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final todos = ref.watch(getTodosProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod Todos"),
      ),
      body: todos.when(
          data: (todosData) {
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
          },
          error: (error, _) => Center(
            child: Text(error.toString()),
          ),
          loading: ()=> Center(
            child: CircularProgressIndicator(),
          )
      )
    );
  }
}

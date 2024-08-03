
import 'package:flutter/material.dart';
import 'package:state_management_app/ui/bloc_practice/bloc_counter.dart';
import 'package:state_management_app/ui/bloc_practice/bloc_todos_page.dart';

class BlocHome extends StatelessWidget {
  const BlocHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Practice"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => BlocCounter()));
                },
                child: const Text(
                  "Bloc Boring Counter",
                  style: TextStyle(fontSize: 20),
                )
            ),
            const SizedBox(height: 18,),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => BlocTodosPage()));
                },
                child: Text(
                  "Bloc Api Call",
                  style: TextStyle(fontSize: 20),
                )
            )
          ],
        ),
      ),
    );;
  }
}

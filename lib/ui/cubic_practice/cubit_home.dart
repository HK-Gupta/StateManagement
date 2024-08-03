import 'package:flutter/material.dart';
import 'package:state_management_app/ui/cubic_practice/cubit_counter.dart';
import 'package:state_management_app/ui/cubic_practice/cubit_todos_page.dart';

class CubitHome extends StatelessWidget {
  const CubitHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit Practice"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const CubitCounter()));
                },
                child: Text(
                  "Cubit Boring Counter",
                  style: TextStyle(fontSize: 20),
                )
            ),
            const SizedBox(height: 18,),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const CubitTodosPage()));
                },
                child: Text(
                  "Cubit Api Call",
                  style: TextStyle(fontSize: 20),
                )
            )
          ],
        ),
      ),
    );;
  }
}

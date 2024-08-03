import 'package:flutter/material.dart';
import 'package:state_management_app/ui/riverpod_practice/riverpod_counter.dart';
import 'package:state_management_app/ui/riverpod_practice/riverpod_todos_page.dart';

class RiverpodHome extends StatelessWidget {
  const RiverpodHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod Practice"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => RiverpodCounter()));
                },
                child: Text(
                  "Riverpod Boring Counter",
                  style: TextStyle(fontSize: 20),
                )
            ),
            const SizedBox(height: 18,),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => RiverpodTodosPage()));
                },
                child: Text(
                  "Riverpod Api Call",
                  style: TextStyle(fontSize: 20),
                )
            )
          ],
        ),
      ),
    );
  }
}

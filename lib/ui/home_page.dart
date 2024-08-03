import 'package:flutter/material.dart';
import 'package:state_management_app/ui/bloc_practice/bloc_home.dart';
import 'package:state_management_app/ui/cubic_practice/cubit_home.dart';
import 'package:state_management_app/ui/riverpod_practice/riverpod_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter State Management Solutions"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> const RiverpodHome()));
                },
                child: const Text(
                  "Flutter Riverpod",
                  style: TextStyle(fontSize: 20),
                )
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> const CubitHome()));
                },
                child: const Text(
                  "Flutter Cubit",
                  style: TextStyle(fontSize: 20),
                )
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> const BlocHome()));
                },
                child: const Text(
                  "Flutter Block",
                  style: TextStyle(fontSize: 20),
                )
            )
          ],
        ),
      ),
    );
  }
}

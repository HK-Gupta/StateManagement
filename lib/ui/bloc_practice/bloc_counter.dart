import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_app/ui/bloc_practice/manager/counter/counter_bloc.dart';

class BlocCounter extends StatelessWidget {
  const BlocCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Counter"),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: "1",
            child: Icon(Icons.add),
            onPressed: (){
              BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
            },
          ),
          const SizedBox(width: 18,),
          FloatingActionButton(
            heroTag: "2",
            child: Icon(Icons.remove),
            onPressed: (){
              BlocProvider.of<CounterBloc>(context).add(DecrementEvent());
            },
          ),
          const SizedBox(width: 18,),
          FloatingActionButton(
            heroTag: "3",
            child: Icon(Icons.refresh),
            onPressed: (){
              BlocProvider.of<CounterBloc>(context).add(RefreshEvent());
            },
          ),
          const SizedBox(width: 18,),
        ],
      ),
      body: BlocConsumer<CounterBloc, int>(
        listener: (context, state) {
          if(state < 0) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text("Negative value is harmful for app.")
              )
            );
          }
        },
        builder: (context, state) {
          return Center(
            child: Text(
              "Counter: $state",
              style: TextStyle(
                fontSize: 25
              ),
            ),
          );
        }
      )
    );
  }
}

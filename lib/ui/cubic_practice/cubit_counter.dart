import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_app/ui/cubic_practice/manager/counter_cubit.dart';

class CubitCounter extends StatelessWidget {
  const CubitCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit Counter",),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: "1",
            child: Icon(Icons.add),
            onPressed: (){
              BlocProvider.of<CounterCubit>(context).increment();
            },
          ),
          const SizedBox(width: 18,),
          FloatingActionButton(
            heroTag: "2",
            child: Icon(Icons.remove),
            onPressed: (){
              BlocProvider.of<CounterCubit>(context).decrement();
            },
          ),
          const SizedBox(width: 18,),
          FloatingActionButton(
            heroTag: "3",
            child: Icon(Icons.refresh),
            onPressed: (){
              BlocProvider.of<CounterCubit>(context).refresh();
            },
          ),
          const SizedBox(width: 18,),
        ],
      ),
      body: BlocConsumer<CounterCubit, int>(
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
              style: TextStyle(fontSize: 25),
            ),
          );
        },
      )
    );
  }
}

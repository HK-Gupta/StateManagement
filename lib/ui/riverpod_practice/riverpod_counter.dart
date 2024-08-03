import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_app/ui/riverpod_practice/manager/riverpod_provider.dart';

class RiverpodCounter extends ConsumerWidget {
  const RiverpodCounter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    ref.listen(counterProvider, (previous, next) {
      if(next <= -1) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Negative value is dangerous for app health"
            )
          )
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod Counter"),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: "1",
            child: Icon(Icons.add),
            onPressed: (){
              ref.read(counterProvider.notifier).state++;
            },
          ),
          const SizedBox(width: 18,),
          FloatingActionButton(
            heroTag: "2",
            child: Icon(Icons.remove),
            onPressed: (){
              ref.read(counterProvider.notifier).state--;
            },
          ),
          const SizedBox(width: 18,),
          FloatingActionButton(
            heroTag: "3",
            child: Icon(Icons.refresh),
            onPressed: (){
              ref.refresh(counterProvider);
            },
          ),
          const SizedBox(width: 18,),
        ],
      ),
      body: Center(
        child: Text(
          "Counter: $count",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}

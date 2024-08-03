import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_app/ui/bloc_practice/manager/counter/counter_bloc.dart';
import 'package:state_management_app/ui/bloc_practice/manager/network/network_bloc.dart';
import 'package:state_management_app/ui/cubic_practice/manager/counter_cubit.dart';
import 'package:state_management_app/ui/cubic_practice/manager/network_cubit/network_cubit.dart';
import 'package:state_management_app/ui/home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NetworkCubit>(create: (_) => NetworkCubit()),
        BlocProvider<CounterCubit>(create: (_) => CounterCubit()),
        BlocProvider<CounterBloc>(create: (_) => CounterBloc()),
        BlocProvider<NetworkBloc>(create: (_) => NetworkBloc())
      ],
      child: const MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          home: HomePage()
      ),
    );
  }
}

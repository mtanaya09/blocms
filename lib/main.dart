import 'package:blocms/logic/cubit/counter_cubit.dart';
import 'package:blocms/router/app_rounter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final CounterState counterState1 = CounterState(counterValue: 0);
  final CounterState counterState2 = CounterState(counterValue: 0);
  debugPrint("${counterState1 == counterState2}");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRounter _appRounter = AppRounter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: _appRounter.onGeneratedRoute,
      ),
    );
  }
}

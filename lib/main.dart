import 'package:blocms/logic/cubit/counter_cubit.dart';
import 'package:blocms/presentation/screens/home_screen.dart';
import 'package:blocms/presentation/screens/second_screen.dart';
import 'package:blocms/presentation/screens/third_screen.dart';
import 'package:blocms/router/app_rounter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final CounterState counterState1 = CounterState(counterValue: 0);
  final CounterState counterState2 = CounterState(counterValue: 0);
  debugPrint("${counterState1 == counterState2}");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRounter _appRounter = AppRounter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: _appRounter.onGeneratedRoute,
    );
  }

  @override
  void dispose() {
    _appRounter.dispose();
    super.dispose();
  }
}

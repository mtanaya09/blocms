import 'package:blocms/logic/cubit/counter_cubit.dart';
import 'package:blocms/logic/cubit/internet_cubit.dart';
import 'package:blocms/router/app_rounter.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class MyClass extends Equatable {
  final int value;

  MyClass({required this.value});

  @override
  List<Object?> get props => [];
}

void main() {
  final a = MyClass(value: 1);
  final b = MyClass(value: 2);

  debugPrint("${a == b}");
  debugPrint("${a == a}");
  debugPrint("${b == b}");
  // runApp(MyApp(
  //   appRounter: AppRounter(),
  //   connectivity: Connectivity(),
  // ));
}

class MyApp extends StatelessWidget {
  final AppRounter? appRounter;
  final Connectivity? connectivity;

  const MyApp({
    Key? key,
    required this.appRounter,
    required this.connectivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: Connectivity()),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: appRounter?.onGeneratedRoute,
      ),
    );
  }
}

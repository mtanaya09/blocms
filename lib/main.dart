import 'package:blocms/logic/cubit/counter_cubit.dart';
import 'package:blocms/logic/cubit/internet_cubit.dart';
import 'package:blocms/router/app_rounter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() {
  runApp(MyApp(
    appRounter: AppRounter(),
    connectivity: Connectivity(),
  ));
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

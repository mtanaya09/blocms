import 'package:blocms/logic/cubit/counter_cubit.dart';
import 'package:blocms/presentation/screens/home_screen.dart';
import 'package:blocms/presentation/screens/second_screen.dart';
import 'package:blocms/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRounter {
  final CounterCubit _counterCubit = CounterCubit();

  Route onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const HomeScreen(
              title: 'HomeScreen',
              color: Colors.blueAccent,
            ),
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const SecondScreen(
              title: 'SecondScreen',
              color: Colors.redAccent,
            ),
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const ThirdScreen(
              title: 'ThirdScreen',
              color: Colors.greenAccent,
            ),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(
            title: 'HomeScreen',
            color: Colors.blueAccent,
          ),
        );
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}

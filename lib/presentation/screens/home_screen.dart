import 'package:blocms/constants/enums.dart';
import 'package:blocms/logic/cubit/counter_cubit.dart';
import 'package:blocms/logic/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    this.title,
    this.color,
  });
  final String? title;
  final Color? color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.Wifi) {
          BlocProvider.of<CounterCubit>(context).increment();
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.Mobile) {
          BlocProvider.of<CounterCubit>(context).decrement();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.color,
          title: Text(widget.title ?? ''),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<InternetCubit, InternetState>(
                  builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Wifi) {
                  return const Text('WIFI');
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Mobile) {
                  return const Text('MOBILE');
                } else if (state is InternetDisconnected) {
                  return const Text('NO INTERNET');
                } else {
                  return const CircularProgressIndicator();
                }
              }),
              // Text('You have pushed the button this many times:'),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state.wasIncremented == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Incremented!'),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  } else if (state.wasIncremented == false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Decremeneted!'),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state.counterValue < 0) {
                    return Text(
                      "BRR, NEGATIVE ${state.counterValue}",
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  } else if (state.counterValue % 2 == 0) {
                    return Text(
                      'YAAAY ${state.counterValue}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  } else if (state.counterValue == 5) {
                    return Text(
                      'AY LIMA ${state.counterValue}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  } else {
                    return Text(
                      state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  }
                },
              ),
              // const SizedBox(
              //   height: 24,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     FloatingActionButton(
              //       heroTag: Text("${widget.title} #1"),
              //       tooltip: 'Decrement',
              //       onPressed: () {
              //         BlocProvider.of<CounterCubit>(context).decrement();
              //       },
              //       child: const Icon(Icons.remove),
              //     ),
              //     FloatingActionButton(
              //       heroTag: Text("${widget.title} #2"),
              //       tooltip: 'Increment',
              //       onPressed: () {
              //         BlocProvider.of<CounterCubit>(context).increment();
              //       },
              //       child: const Icon(Icons.add),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 24,
              ),
              MaterialButton(
                color: widget.color,
                onPressed: () {
                  Navigator.of(context).pushNamed('/second');
                },
                child: const Text('Go to Second Screen'),
              ),
              MaterialButton(
                color: widget.color,
                onPressed: () {
                  Navigator.of(context).pushNamed('/third');
                },
                child: const Text('Go to Second Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

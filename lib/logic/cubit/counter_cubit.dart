import 'dart:async';
import 'package:blocms/constants/enums.dart';
import 'package:blocms/logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  StreamSubscription? internetStreamSubscription;
  CounterCubit({required this.internetCubit})
      : super(CounterState(counterValue: 0)) {
    internetStreamSubscription = monitorCounterCubit();
  }

  StreamSubscription<InternetState> monitorCounterCubit() {
    return internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Wifi) {
        increment();
      } else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Mobile) {
        decrement();
      }
    });
  }

  void increment() => emit(CounterState(
        counterValue: state.counterValue + 1,
        wasIncremented: true,
      ));

  void decrement() => emit(CounterState(
        counterValue: state.counterValue - 1,
        wasIncremented: false,
      ));

  @override
  Future<void> close() {
    internetStreamSubscription?.cancel();
    return super.close();
  }
}

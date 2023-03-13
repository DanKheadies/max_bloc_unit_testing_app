import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:max_bloc_unit_testing_app/models/models.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<CounterStarted>(_onStarted);
    on<CounterIncrementPressed>(_onIncrementPressed);
    on<CounterDecrementPressed>(_onDecrementPressed);
  }

  void _onStarted(
    CounterStarted event,
    Emitter<CounterState> emit,
  ) {
    if (state.status == CounterStatus.success) return;
    Counter counter = const Counter();
    emit(
      CounterState(
        counter: counter,
        status: CounterStatus.success,
      ),
    );
  }

  void _onIncrementPressed(
    CounterIncrementPressed event,
    Emitter<CounterState> emit,
  ) {
    int value = state.counter.value + 1;
    Counter counter = state.counter.copyWith(
      value: value,
    );
    // emit(
    //   CounterState(
    //     counter: counter,
    //     status: CounterStatus.success,
    //   ),
    // );
    emit(
      state.copyWith(
        counter: counter,
        status: CounterStatus.success,
      ),
    );
  }

  void _onDecrementPressed(
    CounterDecrementPressed event,
    Emitter<CounterState> emit,
  ) {
    int value = state.counter.value - 1;
    Counter counter = state.counter.copyWith(
      value: value,
    );
    emit(
      state.copyWith(
        counter: counter,
        status: CounterStatus.success,
      ),
    );
  }
}

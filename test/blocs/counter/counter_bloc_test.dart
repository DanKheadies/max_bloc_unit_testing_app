import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:max_bloc_unit_testing_app/blocs/blocs.dart';
import 'package:max_bloc_unit_testing_app/models/models.dart';

void main() {
  group('CounterBloc', () {
    const mockCounter = Counter();

    setUp(() {});

    CounterBloc buildBloc() {
      return CounterBloc();
    }

    group('construct', () {
      test('works properly', () {
        expect(buildBloc, returnsNormally);
      });

      test('has correct initial state', () {
        expect(
          buildBloc().state,
          equals(
            const CounterState(),
          ),
        );
      });
    });

    group('CounterStarted', () {
      blocTest(
        'emits [success] when is loaded for the first time',
        build: () => CounterBloc(),
        act: (bloc) => bloc.add(CounterStarted()),
        expect: () => [
          const CounterState(
            counter: mockCounter,
            status: CounterStatus.success,
          ),
        ],
      );

      blocTest(
        'emits [] when counter is loaded again',
        build: () => CounterBloc(),
        seed: () => const CounterState(
          counter: mockCounter,
          status: CounterStatus.success,
        ),
        act: (bloc) => bloc.add(CounterStarted()),
        expect: () => [],
      );
    });

    group('CounterIncrementPressed', () {
      blocTest(
        'emits [CounterState] when the user taps the increment button',
        build: () => CounterBloc(),
        act: (bloc) => bloc.add(CounterIncrementPressed()),
        expect: () => [
          const CounterState(
            counter: Counter(
              value: 1,
            ),
            status: CounterStatus.success,
          ),
        ],
      );

      blocTest(
        'emits [CounterState] when the user taps the increment button twice, emits two new states, increases the value by 2',
        build: () => CounterBloc(),
        act: (bloc) => bloc
          ..add(CounterIncrementPressed())
          ..add(CounterIncrementPressed()),
        expect: () => [
          const CounterState(
            counter: Counter(
              value: 1,
            ),
            status: CounterStatus.success,
          ),
          const CounterState(
            counter: Counter(
              value: 2,
            ),
            status: CounterStatus.success,
          ),
        ],
      );

      blocTest(
        'emits [CounterState] when the user taps the increment button twice, increases the value by 2',
        build: () => CounterBloc(),
        act: (bloc) => bloc
          ..add(CounterIncrementPressed())
          ..add(CounterIncrementPressed()),
        skip: 1,
        expect: () => [
          const CounterState(
            counter: Counter(
              value: 2,
            ),
            status: CounterStatus.success,
          ),
        ],
      );
    });

    group('CounterDecrementPressed', () {
      blocTest(
        'emits [CounterState] when the user taps the decrement button',
        build: () => CounterBloc(),
        act: (bloc) => bloc.add(CounterDecrementPressed()),
        expect: () => [
          const CounterState(
            counter: Counter(
              value: -1,
            ),
            status: CounterStatus.success,
          ),
        ],
      );

      blocTest(
        'emits [CounterState] when the user taps the decrement button twice, emits two new states, decreases the value by 2',
        build: () => CounterBloc(),
        act: (bloc) => bloc
          ..add(CounterDecrementPressed())
          ..add(CounterDecrementPressed()),
        expect: () => [
          const CounterState(
            counter: Counter(
              value: -1,
            ),
            status: CounterStatus.success,
          ),
          const CounterState(
            counter: Counter(
              value: -2,
            ),
            status: CounterStatus.success,
          ),
        ],
      );

      blocTest(
        'emits [CounterState] when the user taps the decrement button twice, decreases the value by 2',
        build: () => CounterBloc(),
        act: (bloc) => bloc
          ..add(CounterDecrementPressed())
          ..add(CounterDecrementPressed()),
        skip: 1,
        expect: () => [
          const CounterState(
            counter: Counter(
              value: -2,
            ),
            status: CounterStatus.success,
          ),
        ],
      );
    });
  });
}

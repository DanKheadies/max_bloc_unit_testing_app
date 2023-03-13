import 'package:flutter_test/flutter_test.dart';

import 'package:max_bloc_unit_testing_app/blocs/blocs.dart';
import 'package:max_bloc_unit_testing_app/models/models.dart';

void main() {
  group('CounterState', () {
    const mockCounter = Counter();
    group('CounterState, initial', () {
      const mockStatus = CounterStatus.initial;

      CounterState createSubject() {
        return const CounterState(
          counter: mockCounter,
          status: mockStatus,
        );
      }

      test('supports value equality', () {
        expect(
          createSubject(),
          equals(createSubject()),
        );
      });

      test('props are correct', () {
        expect(
          createSubject().props,
          equals(<Object?>[mockCounter, mockStatus]),
        );
      });

      test('returns object with updated status', () {
        expect(
          createSubject().copyWith(
            status: CounterStatus.success,
          ),
          const CounterState(
            counter: mockCounter,
            status: CounterStatus.success,
          ),
        );
      });

      test('returns a valid [CounterState] with CounterState.fromJson', () {
        final Map<String, dynamic> json = {
          'counter': {'value': 0},
          'status': 'initial',
        };
        final state = CounterState.fromJson(json);
        expect(
          state,
          createSubject(),
        );
      });

      test('returns a Map with CounterState.fromJson', () {
        Map<String, dynamic> json = createSubject().toJson();
        expect(
          json,
          {
            'counter': {'value': 0},
            'status': 'initial',
          },
        );
      });
    });

    group('CounterState, initial', () {
      const mockStatus = CounterStatus.success;

      CounterState createSubject() {
        return const CounterState(
          counter: mockCounter,
          status: mockStatus,
        );
      }

      // TODO: test for success (see above)
    });
  });
}

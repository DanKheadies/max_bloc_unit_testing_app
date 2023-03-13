import 'package:flutter_test/flutter_test.dart';

import 'package:max_bloc_unit_testing_app/blocs/blocs.dart';

void main() {
  group('CounterEvent', () {
    group('CounterStarted', () {
      test('supports value equality', () {
        expect(
          CounterStarted(),
          CounterStarted(),
        );
      });

      test('props are correct', () {
        expect(
          CounterStarted().props,
          equals(<Object?>[]),
        );
      });
    });
    group('CounterIncrementPressed', () {
      test('supports value equality', () {
        expect(
          CounterIncrementPressed(),
          CounterIncrementPressed(),
        );
      });
    });
    group('CounterDecrementPressed', () {
      test('supports value equality', () {
        expect(
          CounterDecrementPressed(),
          CounterDecrementPressed(),
        );
      });
    });
  });
}

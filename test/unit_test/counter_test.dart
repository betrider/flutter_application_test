//1.단위테스트 기본
import 'package:flutter_application_test/counter.dart';
import 'package:test/test.dart';

void main() {
  group('Counter1', () {
    test('1 value should start at 0', () {
      expect(Counter().value, 0);
    });

    test('1 value should be incremented', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });

    test('1 value should be decremented', () {
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });
  });

  group('Counter2', () {
    test('2 value should start at 0', () {
      expect(Counter().value, 0);
    });

    test('2 value should be incremented', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });

    test('2 value should be decremented', () {
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });
  });
}

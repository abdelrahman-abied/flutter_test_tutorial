import 'package:flutter_application_1/counter/counter_ex.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter', () {
    late Counter counter;

    setUp(() {
      counter = Counter();
    });

    test('Counter increments smoke test', () {
      // Arrange
      // final counter = Counter();
      // Act
      counter.increment();
      // Assert
      expect(counter.counter, 1);
    });

    test('Counter decrements smoke test', () {
      // Arrange
      final counter = Counter();
      // Act
      counter.decrement();
      // Assert
      expect(counter.counter, -1);
    });

    test('Counter increments smoke test', () {
      // Arrange
      final counter = Counter();
      // Act
      counter.increment();
      // Assert
      expect(counter.counter, 1);
    });

    test('Counter decrements smoke test', () {
      // Arrange
      final counter = Counter();
      // Act
      counter.decrement();
      // Assert
      expect(counter.counter, -1);
    });
  });
  test('Counter increments smoke test', () {
    // AAA
    // Arrange
    final counter = Counter();
    // Act
    counter.increment();
    // Assert
    expect(counter.counter, 1);
  });
}

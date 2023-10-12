import 'package:minimum_duration/minimum_duration.dart';
import 'package:test/test.dart';

void main() {
  group('$minimumDuration', () {
    test('lasts the default duration', () async {
      final start = DateTime.now();
      final result = await minimumDuration(() => 'hello');
      final end = DateTime.now();

      expect(result, equals('hello'));
      expect(end.difference(start).inMilliseconds, greaterThanOrEqualTo(250));
    });

    test('lasts the custom duration', () async {
      final start = DateTime.now();
      final result = await minimumDuration(
        () => 'hello',
        duration: const Duration(seconds: 1),
      );
      final end = DateTime.now();

      expect(result, equals('hello'));
      expect(end.difference(start).inMilliseconds, greaterThanOrEqualTo(1000));
    });
  });
}

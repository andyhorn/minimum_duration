import 'package:minimum_duration/minimum_duration.dart';
import 'package:test/test.dart';

void main() {
  group(MinimumDuration, () {
    group('implicit (default) duration', () {
      test('it runs for the correct duration', () async {
        final start = DateTime.now();
        final result = await MinimumDuration.run(() => 'hello');
        final end = DateTime.now();

        expect(result, equals('hello'));
        expect(
          end.difference(start),
          greaterThanOrEqualTo(MinimumDuration.duration),
        );
      });
    });

    group('explicit duration', () {
      test('it runs for the specified duration', () async {
        final start = DateTime.now();
        final result = await MinimumDuration.run(
          () => 'hello',
          duration: const Duration(seconds: 1),
        );
        final end = DateTime.now();

        expect(result, equals('hello'));
        expect(
          end.difference(start).inMilliseconds,
          greaterThanOrEqualTo(1000),
        );
      });
    });

    group('configured duration', () {
      const duration = Duration(seconds: 2);

      setUpAll(() {
        MinimumDuration.duration = duration;
      });

      tearDownAll(() {
        MinimumDuration.reset();
      });

      test('it runs the specified duration', () async {
        final start = DateTime.now();
        final result = await MinimumDuration.run(() => 'hello');
        final end = DateTime.now();

        expect(result, equals('hello'));
        expect(
          end.difference(start).inMilliseconds,
          greaterThanOrEqualTo(duration.inMilliseconds),
        );
      });
    });
  });
}

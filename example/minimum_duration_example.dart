import 'package:minimum_duration/minimum_duration.dart';

void main() async {
  await defaultDurationExample();
  await explicitDurationExample();

  MinimumDuration.duration = const Duration(milliseconds: 1500);
  await globallyConfiguredDefaultExample();
  MinimumDuration.reset();
}

Future<void> defaultDurationExample() async {
  final startTime = DateTime.now();

  // Wrap your logic in a call to `MinimumDuration.run`
  final _ = await MinimumDuration.run(() {
    // The logic in here will execute, but the result won't be returned
    // until the minimum duration has elapsed (defaults to 500ms).
    return 'hello world';
  });

  final endTime = DateTime.now();
  final elapsed = endTime.difference(startTime);

  print('[DEFAULT (500ms)] completed in $elapsed');
}

Future<void> explicitDurationExample() async {
  final startTime = DateTime.now();

  // Wrap your logic in a call to `MinimumDuration.run`,
  // passing a `duration` parameter.
  final _ = await MinimumDuration.run(
    () => 'hello world',
    duration: const Duration(seconds: 2),
  );

  final endTime = DateTime.now();
  final elapsed = endTime.difference(startTime);

  print('[EXPLICIT (2s)] completed in $elapsed');
}

Future<void> globallyConfiguredDefaultExample() async {
  final startTime = DateTime.now();
  // Set the global default duration (see line 7 in the `main` function above).
  // Then, wrap your logic in `MinimumDuration.run` as you normally would.
  final _ = await MinimumDuration.run(() => 'hello world');

  final endTime = DateTime.now();
  final elapsed = endTime.difference(startTime);

  print('[CONFIGURED (1500ms)] completed in $elapsed');
}

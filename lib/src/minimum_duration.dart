import 'dart:async';

final class MinimumDuration {
  const MinimumDuration._();

  static const _defaultDuration = Duration(milliseconds: 500);
  static Duration duration = _defaultDuration;

  static void reset() {
    duration = _defaultDuration;
  }

  static Future<T> run<T>(
    FutureOr<T> Function() callback, {
    Duration? duration,
  }) async {
    final target = duration ?? MinimumDuration.duration;
    final start = DateTime.now();
    final result = await callback();
    final end = DateTime.now();
    final elapsed = end.difference(start);

    if (elapsed < target) {
      await Future.delayed(target - elapsed);
    }

    return result;
  }
}

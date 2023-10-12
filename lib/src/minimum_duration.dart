import 'dart:async';

Future<T> minimumDuration<T>(
  FutureOr<T> Function() callback, {
  Duration duration = const Duration(milliseconds: 250),
}) async {
  final start = DateTime.now();
  final result = await callback();
  final end = DateTime.now();
  final elapsed = end.difference(start);

  if (elapsed < duration) {
    await Future.delayed(duration - elapsed);
  }

  return result;
}

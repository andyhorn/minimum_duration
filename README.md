# Minimum Duration

A simple utility function used to force an operation to take _at least_ a given amount of time.

This is most often useful to ensure that some "loading" animation is displayed at least long enough to be seen by the user, even if the loading operation completes very quickly.

This is a super simple implementation, but it helps me avoid writing the same code over and over in every app, and I hope it helps you too!


## Getting started

Just install the package.

```sh
dart/flutter pub add minimum_duration
```

## Usage

Easy! Wrap your logic in a call to `minimumDuration`.

```dart
setLoading(true);

final result = await minimumDuration(
  () async => someAsyncOperation(),
);

setLoading(false);
```

The default Duration is 250ms, but can easily be overridden by providing a `duration` parameter.

```dart
final result = await minimumDuration(
  () async => someAsyncOperation(),
  duration: const Duration(seconds: 1),
);
```

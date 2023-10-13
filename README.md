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

### Basic Usage

Using MinimumDuration is easy! Simply pass a function to `MinimumDuration.run`.

```dart
setLoading(true);

final result = await MinimumDuration.run(
  () async => someAsyncOperation(),
);

setLoading(false);
```

In this example, the return value from `someAsyncOperation` will be assigned to `result` after _at least_ 500ms (the default duration) has elapsed.

If your function takes longer than the specified duration, it will be returned immediately upon completion.

### Custom Duration

The default Duration is **500ms**, but this can easily be overridden by providing a value to the `duration` parameter.

```dart
final result = await MinimumDuration.run(
  () async => someAsyncOperation(),
  duration: const Duration(seconds: 1),
);
```

### Global Default Duration

The default can also be set globally by changing the `MinimumDuration.duration` property.

```dart
// somewhere in your app's initialization code
MinimumDuration.duration = const Duration(seconds: 1);

// later, in your app's logic
// this will run for the "default" duration of 1 second
final result = await MinimumDuration.run(
  () async => someAsyncOperation(),
);
```

This is useful if the default does not fit your use-case and you don't want to pass a custom duration to every call to `MinimumDuration.run`.
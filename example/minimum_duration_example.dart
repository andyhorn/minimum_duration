import 'package:minimum_duration/minimum_duration.dart';

void main() async {
  // Wrap your logic in a call to `minimumDuration`
  final result = await minimumDuration(() {
    // The logic in here will execute, but the result won't be returned
    // until the minimum duration has elapsed (defaults to 250ms).
    print('Some async logic here');
    return 'hello world';
  });

  print(result);
}

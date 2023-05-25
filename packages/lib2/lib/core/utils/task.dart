import 'dart:async';

const POLL_DURATION = const Duration(milliseconds: 200);

class Task {
  static Future waitWhile(bool check(),
      [Duration pollInterval = POLL_DURATION]) {
    return Future.doWhile(
        () => Future.delayed(pollInterval).then((_) => check()));
  }

  static Future waitUtil(bool check(),
      [Duration pollInterval = POLL_DURATION]) {
    return Future.doWhile(
        () => Future.delayed(pollInterval).then((_) => !check()));
  }
}

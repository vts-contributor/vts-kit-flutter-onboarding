class Logger {
  static _prepend(String msg) {
    return '[VTSKIT] $msg';
  }

  static logError(String msg) {
    print('\x1B[31m${_prepend(msg)}\x1B[0m');
  }

  static logSuccess(String msg) {
    print('\x1B[32m${_prepend(msg)}\x1B[0m');
  }

  static logWarning(String msg) {
    print('\x1B[33m${_prepend(msg)}\x1B[0m');
  }

  static log(String msg) {
    print('\x1B[36m${_prepend(msg)}\x1B[0m');
  }

  static Exception throwError(String msg) {
    logError(msg);
    return new Exception(msg);
  }
}

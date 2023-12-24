import 'dart:developer' as dev show log;

class LoggerManager {
  static void log(String message) {
    dev.log(message);
  }

  static void red(String message) {
    const red = '\x1B[31m';
    dev.log("$red$message");
  }

  static void green(String message) {
    const green = '\x1B[32m';
    dev.log("$green$message");
  }

  static void yellow(String message) {
    const yellow = '\x1B[33m';
    dev.log("$yellow$message");
  }
}

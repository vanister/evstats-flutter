abstract class LogService {
  void log(String msg, [List<Object>? params]);
}

class ConsoleLogService implements LogService {
  @override
  void log(String msg, [List<Object>? params]) {
    // todo - use string buffer to build a log message
    throw UnimplementedError();
  }
}

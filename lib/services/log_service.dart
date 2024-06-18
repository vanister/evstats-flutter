abstract class LogService {
  void log(String msg, {String prefix = 'EVSTATS'});
}

class ConsoleLogService implements LogService {
  @override
  void log(String msg, {String prefix = 'EVSTATS'}) {
    // ignore: avoid_print
    print('$prefix >> $msg');
  }
}

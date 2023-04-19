import 'package:logger/logger.dart';

class Log {
  // make this a singleton class
  Log._privateConstructor();
  static final Log instance = Log._privateConstructor();

  static Logger? _logger;
  static Logger get logger {
    if (_logger != null) return _logger!;
    _logger = Logger();
    return _logger!;
  }

  static void debug(text){
    logger.d(text);
  }

  static void error(text){
    logger.e(text);
  }

  static void info(text){
    logger.i(text);
  }

  static void warning(text){
    logger.w(text);
  }

  static void verbose(text){
    logger.v(text);
  }

  static void wtf(text){
    logger.wtf(text);
  }
}
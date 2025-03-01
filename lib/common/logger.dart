import 'package:logger/logger.dart';

final Logger logger = Logger(
  filter: null,
  printer: PrefixPrinter(
    PrettyPrinter(
      noBoxingByDefault: true,
      methodCount: 1,
      colors: false,
      printEmojis: true,
    ),
  ),
  output: null,
);

import 'package:logger/logger.dart';

final Logger logger = Logger(
  filter: null,
  printer: PrefixPrinter(
    PrettyPrinter(
      noBoxingByDefault: true,
      methodCount: 1,
      lineLength: 180,
      colors: false,
      printEmojis: false,
    ),
  ),
  output: null,
);

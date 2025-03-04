import 'package:flutter/cupertino.dart';

import '../../../../common/exception/exception.dart';

@immutable
class LetterId {
  final String value;

  LetterId(this.value) {
    // domain spec
    if (value.isEmpty) {
      throw DomainModelException('letter id must not be empty');
    }
  }
}

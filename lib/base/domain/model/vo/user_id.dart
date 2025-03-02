import 'package:flutter/cupertino.dart';

import '../../../../common/exception/exception.dart';

@immutable
class UserId {
  final String value;

  UserId(this.value) {
    // domain spec
    if (value.isEmpty) {
      throw DomainModelException('user id must not be empty');
    }
  }
}

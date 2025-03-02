import 'package:flutter/cupertino.dart';

import '../../../../common/exception/exception.dart';

@immutable
class UserName {
  final String value;

  UserName(this.value) {
    // domain spec
    if (value.isEmpty) {
      throw DomainModelException('user id must not be empty');
    }
  }
}

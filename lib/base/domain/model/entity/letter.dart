
import 'dart:ui';

import '../vo/letter_id.dart';
import '../vo/user_id.dart';

class Letter {
  final LetterId letterId;
  final UserId senderUserId; // 送信者ID
  final List<List<Offset>> letterData; // 手書きデータ
  final DateTime sentDateTime; // 送信日時
  DateTime? receiptDateTime; // 受信日時

  bool get isRead => receiptDateTime != null;

  Letter(
      this.letterId,
      this.senderUserId,
      this.letterData,
      this.sentDateTime,
      this.receiptDateTime,
      );

  Letter _copyWith({
    final LetterId? letterId,
    final UserId? senderUserId,
    final List<List<Offset>>? letterData,
    final DateTime? sentDateTime,
    final DateTime? receiptDateTime,
  }) {
    return Letter(
      letterId ?? this.letterId,
      senderUserId ?? this.senderUserId,
      letterData ?? this.letterData,
      sentDateTime ?? this.sentDateTime,
      receiptDateTime ?? this.receiptDateTime,
    );
  }

  Letter markAsRead(final DateTime receiptDateTime) {
    return _copyWith(receiptDateTime: receiptDateTime);
  }
}

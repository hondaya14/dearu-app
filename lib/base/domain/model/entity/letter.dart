
import 'dart:ui';

import '../vo/letter_id.dart';
import '../vo/user_id.dart';

class Letter {
  final LetterId letterId;
  final UserId senderUserId; // 送信者ID
  final List<List<Offset>> letterData; // 手書きデータ
  final DateTime sentDateTime; // 送信日時
  final DateTime sentPlanDateTime; // 送信予定日時
  DateTime? receiptDateTime; // 受信日時

  bool get isRead => receiptDateTime != null;

  Letter({
      required this.letterId,
      required this.senderUserId,
      required this.letterData,
      required this.sentDateTime,
      required this.sentPlanDateTime,
      this.receiptDateTime,}
      );

  Letter _copyWith({
    final LetterId? letterId,
    final UserId? senderUserId,
    final List<List<Offset>>? letterData,
    final DateTime? sentDateTime,
    final DateTime? sentPlanDateTime,
    final DateTime? receiptDateTime,
  }) {
    return Letter(
      letterId: letterId ?? this.letterId,
      senderUserId: senderUserId ?? this.senderUserId,
      letterData: letterData ?? this.letterData,
      sentDateTime: sentDateTime ?? this.sentDateTime,
      sentPlanDateTime: sentPlanDateTime ?? this.sentPlanDateTime,
      receiptDateTime: receiptDateTime ?? this.receiptDateTime,
    );
  }

  Letter markAsRead(final DateTime receiptDateTime) {
    return _copyWith(receiptDateTime: receiptDateTime);
  }
}

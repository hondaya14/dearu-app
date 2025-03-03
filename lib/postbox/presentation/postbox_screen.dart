import 'dart:collection';

import 'package:flutter/material.dart';

import '../../base/domain/model/entity/letter.dart';
import '../../base/domain/model/vo/letter_id.dart';
import '../../base/domain/model/vo/user_id.dart';
import '../../common/logger.dart';
import '../../common/router.dart';

class PostboxScreen extends StatefulWidget {
  const PostboxScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PostboxScreenState();
}

class _PostboxScreenState extends State<PostboxScreen> {
  Map<LetterId, Letter> receiptLetterMap = HashMap();

  @override
  void initState() {
    super.initState();
    receiptLetterMap = {
      LetterId('letterId'): Letter(
          letterId: LetterId('letterId'),
          senderUserId: UserId('userId'),
          letterData: [],
          sentDateTime: DateTime.now(),
          sentPlanDateTime: DateTime.now(),
          receiptDateTime: DateTime.now()),
      LetterId('letterId'): Letter(
          letterId: LetterId('letterId'),
          senderUserId: UserId('userId'),
          letterData: [],
          sentDateTime: DateTime.now(),
          sentPlanDateTime: DateTime.now(),
          receiptDateTime: null),
    };
  }

  void _refreshState() async {
    setState(() {
      receiptLetterMap = {
        LetterId('letterId'): Letter(
            letterId: LetterId('letterId'),
            senderUserId: UserId('refreshed!!!!!!!!!'),
            letterData: [],
            sentDateTime: DateTime.now(),
            sentPlanDateTime: DateTime.now(),
            receiptDateTime: DateTime.now()),
        LetterId('letterId'): Letter(
            letterId: LetterId('letterId'),
            senderUserId: UserId('userId'),
            letterData: [],
            sentDateTime: DateTime.now(),
            sentPlanDateTime: DateTime.now(),
            receiptDateTime: DateTime.now()),
      };
    });
  }

  @override
  Widget build(final BuildContext context) {
    return RefreshIndicator(
      elevation: 0,
      color: Colors.black38,
      onRefresh: _refresh,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: _buildLetterList(receiptLetterMap),
      ),
    );
  }

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 2));
    _refreshState();
  }

  List<Widget> _buildLetterList(final Map<LetterId, Letter> receiptLetterMap) {
    return receiptLetterMap.values.map((final Letter letter) {
      final textStyle = TextStyle(
        color: Colors.black,
        fontWeight: letter.isRead ? FontWeight.normal : FontWeight.bold,
      );
      return ListTile(
        title: Text(letter.senderUserId.value),
        titleTextStyle: textStyle,
        subtitle: Text(
          letter.sentDateTime.toIso8601String().substring(0, 10),
        ),
        subtitleTextStyle: textStyle,
        trailing: letter.isRead
            ? null
            : const Icon(Icons.mail, color: Colors.pink, size: 10),
        onTap: () {
          // TODO: Go route detail letter
          logger.i('Navigate to detail letter');
          router.go(AppPathType.letterDetail.fullPath, extra: letter);
        },
      );
    }).toList();
  }
}

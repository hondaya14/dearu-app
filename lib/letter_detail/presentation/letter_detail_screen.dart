import 'package:flutter/material.dart';

import '../../base/domain/model/entity/letter.dart';

class LetterDetailScreen extends StatelessWidget {
  final Letter letter;

  const LetterDetailScreen({super.key, required this.letter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Letter Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Letter Detail'),
            Text('Title: ${letter.senderUserId}'),
            Text('Content: ${letter.letterData}'),
          ],
        ),
      ),
    );
  }
}

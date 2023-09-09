import 'package:flutter/material.dart';

import '../../common/custom_color.dart';
import '../../common/logger.dart';
import 'components/letter_edit_painter.dart';

class LetterEditScreen extends StatelessWidget {
  const LetterEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('save'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              logger.i('save');
            },
          )
        ],
        backgroundColor: CustomColor.fab,
      ),
      body: SafeArea(
        child: CustomPaint(
          painter: LetterEditPainter(),
        ),
      ),
    );
  }
}

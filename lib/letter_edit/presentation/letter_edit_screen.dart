import 'package:flutter/material.dart';

import '../../common/logger.dart';
import 'components/floating_action_button.dart';
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
          ),
        ],
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: CustomPaint(
          painter: LetterEditPainter(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: closeFloatingActionButton(),
    );
  }
}

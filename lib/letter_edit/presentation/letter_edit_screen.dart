import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/letter_edit_painter.dart';
import 'components/floating_action_button.dart';

class DrawingPage extends StatefulWidget {
  const DrawingPage({Key? key}) : super(key: key);

  @override
  _DrawingPageState createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPage> {
  List<Offset?> points = [];

  // 描画履歴を保存するリスト
  List<List<Offset>> strokes = [];

  // 現在描画中の線
  List<Offset> currentStroke = [];

  // 鉛筆の濃さ
  double pencilDarkness = 0.8;

  // 鉛筆の太さ
  double pencilThickness = 3.0;

  // 鉛筆の色
  Color pencilColor = Colors.black;

  // 紙のテクスチャ種類
  PaperTexture paperTexture = PaperTexture.washi;

  // 紙の色
  Color paperColor = Colors.white;

  // テクスチャの強さ
  double textureIntensity = 0.1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Builder(
          builder: (context) {
            return GestureDetector(
              onPanStart: (details) {
                setState(() {
                  currentStroke = [details.localPosition];
                });
              },
              onPanUpdate: (details) {
                setState(() {
                  currentStroke.add(details.localPosition);
                });
              },
              onPanEnd: (details) {
                setState(() {
                  strokes.add(List.from(currentStroke));
                  currentStroke.clear();
                });
              },
              child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final List<Offset?> points = ref.watch(pointSP);
                  return CustomPaint(
                    painter: LetterEditPainter(
                      strokes: strokes,
                      currentStroke: currentStroke,
                      pencilDarkness: pencilDarkness,
                      pencilThickness: pencilThickness,
                      pencilColor: pencilColor,
                      paperTexture: paperTexture,
                      paperColor: paperColor,
                      textureIntensity: textureIntensity,
                    ),
                    size: Size.infinite,
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: closeFloatingActionButton(),
    );
  }
}

import 'package:flutter/material.dart';

import '../../common/router.dart';
import '../controller/letter_edit_painter.dart';

class DrawingPage extends StatefulWidget {
  const DrawingPage({Key? key}) : super(key: key);

  @override
  _DrawingPageState createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPage> {
  // 描画履歴を保存するリスト
  List<List<Offset>> strokes = [];

  List<Offset> currentStroke = [];

  double pencilDarkness = 0.9;
  double pencilThickness = 3.0;
  Color pencilColor = Colors.black;
  Color paperColor = Colors.white;
  double textureIntensity = 0.1;

  // 変換行列（拡大縮小用）
  double _scale = 1.0;
  Offset _offset = Offset.zero;
  bool _isDrawingMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            router.go(AppPathType.base.fullPath);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              // 保存処理
              generateSvgData(strokes: strokes);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Builder(
          builder: (context) {
            // todo: gesture recognizerで二本指の時を実装する
            return GestureDetector(
              // onPanStart: (details) {
              //   setState(() {
              //     currentStroke = [details.localPosition];
              //   });
              // },
              // onPanUpdate: (details) {
              //   setState(() {
              //     currentStroke.add(details.localPosition);
              //   });
              // },
              // onPanEnd: (details) {
              //   setState(() {
              //     strokes.add(List.from(currentStroke));
              //     currentStroke.clear();
              //   });
              // },
              onScaleStart: _handleScaleStart,
              onScaleUpdate: _handleScaleUpdate,
              onScaleEnd: _handleScaleEnd,
              child: CustomPaint(
                painter: LetterEditPainter(
                  strokes: strokes,
                  currentStroke: currentStroke,
                  scale: _scale,
                  offset: _offset,
                  pencilDarkness: pencilDarkness,
                  pencilThickness: pencilThickness,
                  pencilColor: pencilColor,
                  paperColor: paperColor,
                  textureIntensity: textureIntensity,
                ),
                size: Size.infinite,
              ),
            );
          },
        ),
      ),
    );
  }

  String generateSvgData({
    required final List<List<Offset>> strokes,
    final double width = 1200,
    final double height = 1200,
    final double strokeWidth = 1.0,
    final String strokeColor = '#111111',
  }) {
    // SVG のヘッダ部分
    final sb = StringBuffer();
    sb.write(
      '<svg width="$width" height="$height" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 $width $height">\n',
    );

    for (final stroke in strokes) {
      if (stroke.isEmpty) continue;

      // M x0 y0 から始めて、あとは L x y を連結
      final start = stroke.first;
      final pathBuffer = StringBuffer();
      pathBuffer.write('M ${start.dx} ${start.dy}');

      // 残りの点は L コマンドとして結ぶ
      for (int i = 1; i < stroke.length; i++) {
        pathBuffer.write(' L ${stroke[i].dx} ${stroke[i].dy}');
      }
      sb.write(
        '  <path d="${pathBuffer.toString()}" stroke="$strokeColor" stroke-width="$strokeWidth" fill="none" />\n',
      );
    }

    // SVG のフッタ部分
    sb.write('</svg>');
    return sb.toString();
  }

  void _handleScaleStart(ScaleStartDetails details) {
    // ポインタの数に基づいて描画モードかパン/ズームモードかを判断
    if (details.pointerCount == 1) {
      _isDrawingMode = true;
      setState(() {
        currentStroke = <Offset>[
          (details.localFocalPoint - _offset) / _scale,
        ];
      });
    } else {
      _isDrawingMode = false;
      // 現在描画中の線があれば確定させる
      if (currentStroke.isNotEmpty) {
        setState(() {
          strokes.add(currentStroke);
          currentStroke = [];
        });
      }
    }
  }

  void _handleScaleUpdate(ScaleUpdateDetails details) {
    if (_isDrawingMode) {
      // 描画モード: 線を描く
      setState(() {
        currentStroke.add((details.localFocalPoint - _offset) / _scale);
      });
    } else {
      // パン/ズームモード: 拡大縮小と移動
      setState(() {
        // スケールの更新
        _scale = (_scale * details.scale).clamp(0.5, 3.0);

        // 位置の更新
        _offset += details.focalPointDelta;
      });
    }
  }

  void _handleScaleEnd(ScaleEndDetails details) {
    if (_isDrawingMode) {
      // 描画モード: 現在の線を確定
      if (currentStroke.isNotEmpty) {
        setState(() {
          strokes.add(currentStroke);
          currentStroke = [];
        });
      }
    }
    _isDrawingMode = false;
  }
}

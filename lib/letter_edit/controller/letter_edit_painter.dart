import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/logger.dart';

final pointSP = StateNotifierProvider<PointStateNotifier, List<Offset?>>((ref) {
  return PointStateNotifier([]);
});

class PointStateNotifier extends StateNotifier<List<Offset?>> {
  PointStateNotifier(super._state);

  void update(List<Offset?> points) {
    state = points;
  }

  void delete() {
    state.clear();
  }

}

class LetterEditPainter extends CustomPainter {
  final List<Offset?> points;

  LetterEditPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    logger.i(points);
    final Paint paint = Paint()
      ..color = const Color(0xFF000000)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10
      ..strokeJoin = StrokeJoin.miter;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant LetterEditPainter oldDelegate) {
    return oldDelegate.points != points;
  }
}

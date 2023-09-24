import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/letter_edit_painter.dart';
import 'components/floating_action_button.dart';

class LetterEditScreen extends ConsumerWidget {
  const LetterEditScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Offset?> points = [];
    return Scaffold(
      body: SafeArea(
        child: Builder(
          builder: (context) {
            return GestureDetector(
              onPanStart: (details) {
                RenderBox? renderBox = context.findRenderObject() as RenderBox?;
                Offset? localPosition = renderBox!.globalToLocal(details.globalPosition);
                points = List.from(points)..add(localPosition);
                ref.read(pointSP.notifier).update(points);
              },
              onPanUpdate: (details) {
                RenderBox? renderBox = context.findRenderObject() as RenderBox?;
                Offset? localPosition = renderBox!.globalToLocal(details.globalPosition);
                points = List.from(points)..add(localPosition);
                ref.read(pointSP.notifier).update(points);
              },
              onPanEnd: (details) {
                points.add(null);
                ref.read(pointSP.notifier).update(points);
              },
              child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final List<Offset?> points = ref.watch(pointSP);
                  return CustomPaint(
                    painter: LetterEditPainter(points: points),
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

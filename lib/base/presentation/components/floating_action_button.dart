import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../common/custom_color.dart';

Widget floatingActionButton() {
  return ClipRect(
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
      child: FloatingActionButton(
        elevation: 5,
        backgroundColor: CustomColor.fab,
        onPressed: () {
          print('press fab');
        },
        child: const Icon(Icons.edit, color: Color(0xFFFFFFFF), size: 30),
      ),
    ),
  );
}

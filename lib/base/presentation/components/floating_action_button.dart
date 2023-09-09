import 'dart:ui';

import 'package:dearu/common/router.dart';
import 'package:flutter/material.dart';

import '../../../common/custom_color.dart';

Widget letterEditFloatingActionButton() {
  return ClipRect(
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
      child: FloatingActionButton(
        elevation: 5,
        backgroundColor: CustomColor.fab,
        onPressed: () {
          router.go(AppPath.letterEdit);
        },
        child: const Icon(Icons.edit, color: Color(0xFFFFFFFF), size: 30),
      ),
    ),
  );
}

import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../common/custom_color.dart';
import '../../../common/router.dart';

Widget letterEditFloatingActionButton() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(16.0),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
      child: FloatingActionButton(
        elevation: 5,
        backgroundColor: CustomColor.fab,
        onPressed: () {
          router.go(AppPathType.letterEdit.fullPath);
        },
        child: const Icon(Icons.edit, color: Color(0xFFFFFFFF), size: 30),
      ),
    ),
  );
}

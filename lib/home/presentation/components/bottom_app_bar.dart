import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../common/custom_color.dart';

Widget bottomAppBar() {
  return ClipRect(
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
      child: BottomAppBar(
        elevation: 0,
        color: CustomColor.bgBAB,
        shape: const AutomaticNotchedShape(
          RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
          RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
        ),
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _bABIconButton(Icons.home, null, true),
            _bABIconButton(Icons.inbox_rounded, null, false),
            _dummyIconButton(),
            _bABIconButton(Icons.group, null, false),
            _bABIconButton(Icons.settings, null, false),
          ],
        ),
      ),
    ),
  );
}

// BottomAppBarIconButton
Container _bABIconButton(IconData iconData, VoidCallback? onPressed, bool isSelected) {
  return Container(
    decoration: isSelected
        ? BoxDecoration(
            gradient: RadialGradient(
              colors: [CustomColor.icon, const Color(0xFFB9B9B9)],
            ),
            shape: BoxShape.circle,
          )
        : null,
    child: IconButton(
      icon: Icon(iconData, color: CustomColor.icon, size: 30),
      onPressed: onPressed,
    ),
  );
}

// dummyIconButton for Floating action button on bottomAppBar
IconButton _dummyIconButton() {
  return const IconButton(
      icon: Icon(Icons.circle, color: Colors.transparent, size: 0), onPressed: null);
}

import 'package:flutter/material.dart';

import 'custom_color.dart';

Widget noFeature(final BuildContext context) {
  final Size size = MediaQuery.of(context).size;
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.accessibility_outlined,
          size: size.width / 3,
          color: CustomColor.bgBAB,
        ),
        const Text('この機能はまだない！'),
        const Text('あなたの支援が必要だ！'),
      ],
    ),
  );
}

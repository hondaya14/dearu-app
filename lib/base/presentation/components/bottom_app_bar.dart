import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/custom_color.dart';
import '../../domain/value/screen.dart';
import '../../presentation/controller/screen_controller.dart';
import '../../service/screen_service.dart';

Widget bottomAppBar(ScreenService screenService) {
  return ClipRect(
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
      child: BottomAppBar(
        elevation: 0,
        color: CustomColor.bgBAB,
        shape: const AutomaticNotchedShape(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
          RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
        ),
        padding: EdgeInsets.zero,
        child: Consumer(
          builder: (
            final BuildContext context,
            final WidgetRef ref,
            final Widget? child,
          ) {
            final Screen currentScreen = ref.watch(currentScreenSNP);
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _bottomAppBarIconButton(
                  iconData: Icons.home,
                  onPressed: () => screenService.moveTo(ref, Screen.home),
                  isSelected: currentScreen == Screen.home,
                ),
                _bottomAppBarIconButton(
                  // TODO: 新着バッチ
                  iconData: Icons.mail_outline,
                  onPressed: () => screenService.moveTo(ref, Screen.postbox),
                  isSelected: currentScreen == Screen.postbox,
                ),
                _dummyIconButton(),
                _bottomAppBarIconButton(
                  iconData: Icons.group,
                  onPressed: () => screenService.moveTo(ref, Screen.contacts),
                  isSelected: currentScreen == Screen.contacts,
                ),
                _bottomAppBarIconButton(
                  iconData: Icons.menu,
                  onPressed: () => screenService.moveTo(ref, Screen.menu),
                  isSelected: currentScreen == Screen.menu,
                ),
              ],
            );
          },
        ),
      ),
    ),
  );
}

// BottomAppBarIconButton
Widget _bottomAppBarIconButton(
    {required final IconData iconData,
    final VoidCallback? onPressed,
    required final bool isSelected}) {
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
      icon: Icon(Icons.circle, color: Colors.transparent, size: 0),
      onPressed: null);
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/value/screen.dart';

final currentScreenSNP = StateNotifierProvider<ScreenStateNotifier, Screen>((ref) {
  return ScreenStateNotifier(Screen.home);
});

class ScreenStateNotifier extends StateNotifier<Screen> {
  ScreenStateNotifier(super._state);

  void changeState(Screen screen) {
    state = screen;
  }
}

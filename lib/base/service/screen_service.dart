import 'package:dearu/base/domain/value/screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../presentation/controller/screen_controller.dart';

class ScreenService {
  void moveTo(WidgetRef ref, Screen screen) {
    ref.read(currentScreenSNP.notifier).changeState(screen);
  }
}

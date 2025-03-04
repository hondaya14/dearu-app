import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../base/domain/value/screen.dart';
import '../presentation/controller/screen_controller.dart';

class ScreenService {
  void moveTo(WidgetRef ref, Screen screen) {
    ref.read(currentScreenSNP.notifier).changeState(screen);
  }
}

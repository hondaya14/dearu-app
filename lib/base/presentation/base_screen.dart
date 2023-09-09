import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './controller/screen_controller.dart';
import '../../contacts/presentation/contacts_screen.dart';
import '../../home/presentation/home_screen.dart';
import '../../postbox/presentation/postbox_screen.dart';
import '../../setting/presentation/setting_screen.dart';
import '../domain/value/screen.dart';
import '../service/screen_service.dart';
import 'components/bottom_app_bar.dart';
import 'components/floating_action_button.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({super.key});

  final ScreenService screenService = ScreenService();

  final List<Widget> _screens = [
    const HomeScreen(),
    const PostboxScreen(),
    Container(), //dummy
    const ContactsScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            Screen currentScreen = ref.watch(currentScreenSNP);
            return IndexedStack(
              index: currentScreen.index,
              children: _screens,
            );
          },
        ),
      ),
      bottomNavigationBar: bottomAppBar(screenService),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: letterEditFloatingActionButton(),
    );
  }
}

import 'package:dearu/contacts/presentation/contacts_screen.dart';
import 'package:dearu/home/presentation/home_screen.dart';
import 'package:dearu/postbox/presentation/postbox_screen.dart';
import 'package:dearu/setting/presentation/setting_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
    GoRoute(path: '/postbox', builder: (context, state) => PostboxScreen()),
    GoRoute(path: '/contacts', builder: (context, state) => ContactsScreen()),
    GoRoute(path: '/setting', builder: (context, state) => SettingScreen()),
  ],
);

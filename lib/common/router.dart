import 'package:dearu/base/presentation/base_screen.dart';
import 'package:dearu/letterEdit/presentation/letter_edit_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AppPath {
  static const String base = "/base";
  static const String letterEdit = "/letter-edit";
}

final router = GoRouter(
  initialLocation: AppPath.base,
  routes: [
    GoRoute(path: AppPath.base, builder: (context, state) => BaseScreen()),
    GoRoute(
        path: AppPath.letterEdit,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: LetterEditScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeIn).animate(animation),
                child: child,
              );
            },
          );
        }),
  ],
);

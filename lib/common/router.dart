import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../base/domain/model/entity/letter.dart';
import '../base/presentation/base_screen.dart';
import '../letter_detail/presentation/letter_detail_screen.dart';
import '../letter_edit/presentation/letter_edit_screen.dart';

// class AppPath {
//   static const String base = '/base';
//   static const String letterEdit = '/letter-edit';
//   static const String letterDetail = 'letter-detail';
//
//   // Sub paths
//   static const String letterDetailPath = '$base/$letterDetail';
// }

enum AppPathType {
  base('base', '/base'),
  letterEdit('letter-edit', '/letter-edit'),
  letterDetail('letter-detail', '/base/letter-detail');

  const AppPathType(this.singlePath, this.fullPath);

  final String singlePath;
  final String fullPath;
}

final router = GoRouter(
  initialLocation: AppPathType.base.fullPath,
  routes: [
    GoRoute(
      path: AppPathType.base.fullPath,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: BaseScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.linear).animate(animation),
              child: child,
            );
          },
        );
      },
      routes: [
        GoRoute(
          path: AppPathType.letterDetail.singlePath,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: LetterDetailScreen(letter: state.extra as Letter),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeIn).animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
      ],
    ),
    GoRoute(
      path: AppPathType.letterEdit.fullPath,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: DrawingPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeIn).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
  ],
);

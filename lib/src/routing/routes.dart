import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seenear/src/features/common/navigator/view/bottom_navigator.dart';
import 'package:seenear/src/features/common/select_role/view/select_role_view.dart';
import 'package:seenear/src/features/common/splash/view/splash_screen.dart';
import 'package:seenear/src/features/junior/auth/edit_nickname/view/edit_nickname_view.dart';
import 'package:seenear/src/features/junior/auth/signin/view/signin_view.dart';
import 'package:seenear/src/features/junior/cards/card_screen.dart';
import 'package:seenear/src/features/junior/counsel/select_gender/view/select_gender_view.dart';
import 'package:seenear/src/features/junior/counsel/select_worry/view/select_worry_view.dart';
import 'package:seenear/src/features/junior/mypage/view/mypage_view.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final configRouter = GoRouter(
  initialLocation: "/splash",
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
        path: "/splash",
        name: "/splash",
        pageBuilder: (context, state) =>
            const MaterialPage(child: SplashScreen())),
    GoRoute(
      path: '/selectRole',
      name: '/selectRole',
      pageBuilder: (context, state) =>
          const MaterialPage(child: SelectRoleView()),
    ),
    GoRoute(
      path: "/signin",
      name: "/signin",
      pageBuilder: (context, state) => const MaterialPage(child: SigninView()),
    ),
    GoRoute(
      path: '/editNickname',
      name: '/editNickname',
      pageBuilder: (context, state) =>
          const MaterialPage(child: EditNicknameView()),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/selectWorry',
              pageBuilder: (context, state) =>
                  const MaterialPage(child: SelectWorryView()),
              routes: [
                GoRoute(
                  path: 'selectGender/:worryCategory',
                  pageBuilder: (context, state) {
                    final category =
                        state.pathParameters['worryCategory'] ??= "";
                    return MaterialPage(
                      child: SelectGenderView(worryCategory: category),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/card',
            pageBuilder: (context, state) =>
                const MaterialPage(child: CardScreen()),
          ),
        ]),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/mypage',
              pageBuilder: (context, state) =>
                  const MaterialPage(child: MypageView()),
            ),
          ],
        ),
      ],
    ),
  ],
);

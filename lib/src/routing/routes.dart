import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:seenear/common/providers/global_provider.dart';
import 'package:seenear/src/features/common/navigator/view/bottom_navigator.dart';
import 'package:seenear/src/features/common/select_role/view/select_role_view.dart';
import 'package:seenear/src/features/common/splash/view/splash_screen.dart';
import 'package:seenear/src/features/senior/advice/select_advice_type/select_advice_type_screen.dart';
import 'package:seenear/src/features/senior/intro/edit_nickname/edit_nickname_screen.dart';
import 'package:seenear/src/features/senior/intro/select_gender/select_gender_screen.dart';
import 'package:seenear/src/features/senior/intro/select_types/select_types_screen.dart';
import 'package:seenear/src/features/senior/listen_thank/check_thank_list/check_thank_list_screen.dart';
import 'package:seenear/src/features/junior/auth/edit_nickname/view/edit_nickname_view.dart';
import 'package:seenear/src/features/junior/cards/detail_card/view/detail_card_view.dart';
import 'package:seenear/src/features/junior/counsel/chat/chat_view.dart';
import 'package:seenear/src/features/junior/counsel/select_gender/select_gender_view.dart';
import 'package:seenear/src/features/junior/counsel/select_worry/select_worry_view.dart';
import 'package:seenear/src/features/junior/cards/card_screen.dart';
import 'package:seenear/src/features/junior/mypage/view/mypage_view.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final configRouter = GoRouter(
  initialLocation: "/splash",
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/selectRole',
      name: '/selectRole',
      pageBuilder: (context, state) =>
          const MaterialPage(child: SelectRoleView()),
    ),
    GoRoute(
      path: "/thanklist",
      name: "/thanklist",
      pageBuilder: (context, state) =>
          const MaterialPage(child: CheckThankListScreen()),
    ),
    GoRoute(
      path: "/type",
      name: "/type",
      pageBuilder: (context, state) =>
          const MaterialPage(child: SelectTypesScreen()),
    ),
    GoRoute(
      path: "/input",
      name: "/input",
      pageBuilder: (context, state) =>
          const MaterialPage(child: EditNicknameScreen()),
    ),
    GoRoute(
      path: "/senior",
      name: "/senior",
      pageBuilder: (context, state) =>
          const MaterialPage(child: SelectGenderScreen()),
    ),
    GoRoute(
      path: "/adviceType",
      name: "/adviceType",
      pageBuilder: (context, state) =>
          const MaterialPage(child: SelectAdviceTypeScreen()),
    ),
    GoRoute(
        path: "/splash",
        name: "/splash",
        pageBuilder: (context, state) =>
            const MaterialPage(child: SplashScreen())),
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
                  path: 'worry',
                  pageBuilder: (context, state) {
                    final category =
                        Provider.of<GlobalProvider>(context, listen: false)
                            .worryCategory;

                    return MaterialPage(
                      child: SelectGenderView(worryCategory: category),
                    );
                  },
                ),
              ],
            ),
            GoRoute(
                path: '/chat',
                pageBuilder: (context, state) {
                  return const MaterialPage(child: ChatView());
                }),
          ],
        ),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/card',
            pageBuilder: (context, state) =>
                const MaterialPage(child: CardScreen()),
            routes: [
              GoRoute(
                  path: 'detailCard',
                  pageBuilder: (context, state) {
                    return const MaterialPage(child: DetailCardView());
                  }),
            ],
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

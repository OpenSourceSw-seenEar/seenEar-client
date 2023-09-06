import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:seenear/core/extension/string_extension.dart';
import 'package:seenear/src/constants/colors.dart';
import 'package:seenear/src/features/common/navigator/view_model/bottom_navigator_view_model.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigatorController>(
      builder: (context, controller, child) => Scaffold(
        body: navigationShell,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: NavigationBar(
            selectedIndex: navigationShell.currentIndex,
            backgroundColor: ColorSystem.white,
            indicatorColor: ColorSystem.white,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            elevation: 3,
            shadowColor: Colors.black,
            height: controller.navBarHeight(context),
            destinations: [
              NavigationDestination(
                icon: navigationShell.currentIndex == 0
                    ? SvgPicture.asset('home_selected'.toSVG)
                    : SvgPicture.asset('home_unselected'.toSVG),
                label: 'home',
              ),
              NavigationDestination(
                icon: navigationShell.currentIndex == 1
                    ? SvgPicture.asset('card_selected'.toSVG)
                    : SvgPicture.asset('card_unselected'.toSVG),
                label: 'card',
              ),
              NavigationDestination(
                icon: navigationShell.currentIndex == 2
                    ? SvgPicture.asset('profile_selected'.toSVG)
                    : SvgPicture.asset('profile_unselected'.toSVG),
                label: 'mypage',
              ),
            ],
            onDestinationSelected: _goBranch,
          ),
        ),
      ),
    );
  }
}

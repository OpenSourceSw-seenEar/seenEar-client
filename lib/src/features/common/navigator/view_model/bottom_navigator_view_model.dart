import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigatorController extends ChangeNotifier {
  final GoRouter goRouter;
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  BottomNavigatorController(this.goRouter);

  void setPage(int index) {
    _selectedIndex = index;
    switch (index) {
      case 0:
        goRouter.go('/selectWorry');
        break;
      case 1:
        goRouter.go('/selectWorry');
        break;
      case 2:
        goRouter.go('/mypage');
        break;
    }
    notifyListeners();
  }

  double navBarHeight(BuildContext context) {
    return (Platform.isAndroid || View.of(context).physicalSize.width <= 1080)
        ? 56
        : 60;
  }
}

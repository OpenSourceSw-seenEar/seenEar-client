import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seenear/core/base/model/base_view_model.dart';
import 'package:seenear/core/init/db/local_manager.dart';

class SplashViewModel extends BaseViewModel with ChangeNotifier {
  @override
  void init() {
    controlAppState();
  }

  Future<void> controlAppState() async {
    await deviceAndCacheInit();
  }

  Future<void> deviceAndCacheInit() async {
    await Future.wait([LocaleManager.prefrencesInit()]);
  }

  @override
  void setContext(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      context.go('/');
    });
  }
}

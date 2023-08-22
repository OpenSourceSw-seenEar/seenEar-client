import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seenear/core/base/model/base_view_model.dart';

class SplashViewModel extends BaseViewModel with ChangeNotifier {
  @override
  void init() {}

  @override
  void setContext(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      context.go('/');
    });
  }
}

import 'package:go_router/go_router.dart';
import 'package:seenear/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';

class SelectRoleViewModel extends BaseViewModel {
  @override
  void init() {}

  @override
  void setContext(BuildContext context) {}

  void onTapJunior(BuildContext context) {
    context.go('/signin');
  }

  void onTapSenior(BuildContext context) {
    context.go('/senior');
  }
}

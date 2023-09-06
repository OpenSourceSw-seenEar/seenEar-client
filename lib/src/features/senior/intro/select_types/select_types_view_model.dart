import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seenear/core/base/model/base_view_model.dart';

class SelectTypesViewModel extends BaseViewModel {
  @override
  void init() {}

  @override
  void setContext(BuildContext context) {}

  void onTapThanklist(BuildContext context) {
    context.go('/thanklist');
  }

  void onTapRecodeVioce(BuildContext context) {
    context.go('/recodeVoice');
  }
}

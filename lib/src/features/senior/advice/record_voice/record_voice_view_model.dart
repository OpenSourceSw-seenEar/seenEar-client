import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:seenear/core/base/model/base_view_model.dart';

class RecordVoiceViewModel extends BaseViewModel {
  @override
  void init() {}

  @override
  void setContext(BuildContext context) {}

  void onTapRecord(BuildContext context) {
    context.go('/recordProceed');
  }
}

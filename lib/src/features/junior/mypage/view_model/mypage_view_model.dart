import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seenear/common/providers/global_provider.dart';
import 'package:seenear/core/base/model/base_view_model.dart';

class MypageViewModel extends BaseViewModel {
  @override
  void init() {}

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  String get nickname => Provider.of<GlobalProvider>(viewModelContext).nickname;
}

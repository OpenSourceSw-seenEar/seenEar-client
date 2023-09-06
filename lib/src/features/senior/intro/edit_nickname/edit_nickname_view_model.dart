import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seenear/core/base/model/base_view_model.dart';

class EditNicknameViewModel extends BaseViewModel {
  TextEditingController textEditingController = TextEditingController();
  bool isButtonEnabled = false;

  EditNicknameViewModel() {
    textEditingController.addListener(() {
      isButtonEnabled = textEditingController.text.length >= 2;
      notifyListeners(); // 상태가 변경되면 notifyListeners 호출
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void init() {}

  @override
  void setContext(BuildContext context) {}

  void onTapConfirm(BuildContext context) {
    context.go('/type');
  }
}

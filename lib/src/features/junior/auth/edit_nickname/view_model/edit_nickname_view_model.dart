import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seenear/core/base/model/base_view_model.dart';
import 'package:seenear/core/utils/utils.dart';

class EditNicknameViewModel extends BaseViewModel {
  String nickname = '';
  final textController = TextEditingController();
  @override
  void init() {}

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void onFinish(BuildContext context) {
    if (textController.text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      showToast("특수문자는 사용할 수 없습니다.");
      return;
    }
    if (textController.text.length > 10) {
      showToast("닉네임은 10글자 이하이어야 합니다.");
      return;
    }
    //TODO : 닉네임 중복 체크
    context.go('/selectWorry');
  }
}

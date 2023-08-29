import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:seenear/core/base/model/base_view_model.dart';
import 'package:seenear/core/init/db/local_manager.dart';
import 'package:seenear/src/constants/enums/local_keys_enum.dart';
import 'package:seenear/src/features/junior/auth/signin/service/signin_service.dart';
import 'package:seenear/core/utils/utils.dart';

class SigninViewModel extends BaseViewModel {
  AuthService? authService;
  bool isLoading = false;

  SigninViewModel({this.authService});

  @override
  void init() {}

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  void goNext(BuildContext context) {
    context.go('/editNickname');
  }

  void query() async {
    log((await authService?.query("eea")).toString());
  }

  void kakaoLogin() {
    isLoading = true;
    notifyListeners();

    try {
      authService!.kakaoLogin().then((value) {
        //TODO : API 연결해 토큰 검사 후 LocaleManager에 저장
        LocaleManager.instance
            .setStringValue(PreferencesKeys.token, value.accessToken);
        log(value.accessToken);

        goNext(viewModelContext);
      });
    } catch (e, s) {
      if (e is KakaoAuthException && e.error.toString() == "access_denied") {
        return;
      }
      showToast("로그인 중 문제가 발생하였습니다");
      log(e.toString(), stackTrace: s);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

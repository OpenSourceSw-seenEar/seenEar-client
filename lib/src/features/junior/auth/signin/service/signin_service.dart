import 'dart:developer';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:seenear/core/base/model/base_model.dart';
import 'package:seenear/core/network/network_manager.dart';
import 'package:seenear/core/network/response_model.dart';
import 'package:seenear/src/constants/enums/http_request_enum.dart';
import 'package:seenear/src/features/junior/auth/signin/model/signin_model.dart';

class AuthService {
  final NetworkManager networkManger;

  AuthService(this.networkManger);

  Future<Map<String, dynamic>?> query(String keyword) async {
    try {
      final response = await networkManger.coreDio
          ?.send<Map<String, dynamic>, BaseModel<dynamic>>(
        '',
        type: HttpTypes.get,
        parseModel: SigninModel(),
        headers: {'Authorization': 'KakaoAK abf86987c958ad34e9313ed7e91008c5'},
        queryParameters: {'query': keyword},
      );

      if (response is ResponseModel) {
        return response!.data;
      } else if (response is IErrorModel) {
        log('API call failed: ${response!.error}');
      }
    } catch (e) {
      log('Exception occurred: $e');
    }
    return null;
  }

  Future<OAuthToken> kakaoLogin() async {
    OAuthToken oauth;
    final isInstalled = await isKakaoTalkInstalled();
    if (isInstalled) {
      oauth = await UserApi.instance.loginWithKakaoTalk();
    } else {
      oauth = await UserApi.instance.loginWithKakaoAccount();
    }
    return oauth;
  }
}

class NaverText {
  Future<String> naver() async {
    return Future(() => "");
  }
}

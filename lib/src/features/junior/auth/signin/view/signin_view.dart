import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:seenear/core/base/view/base_view.dart';
import 'package:seenear/core/extension/context_extension.dart';
import 'package:seenear/core/extension/string_extension.dart';
import 'package:seenear/core/network/network_manager.dart';
import 'package:seenear/src/constants/fonts.dart';
import 'package:seenear/src/features/junior/auth/signin/service/signin_service.dart';
import 'package:seenear/src/features/junior/auth/signin/view_model/siginin_view_model.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SigninViewModel>(
      viewModel:
          SigninViewModel(authService: AuthService(NetworkManager.instance)),
      onModelReady: (model) => {model.setContext(context)},
      builder: (context, model, child) => Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox.shrink(),
            SvgPicture.asset('splash'.toSVG),
            model.isLoading
                ? const CircularProgressIndicator()
                : GestureDetector(
                    onTap: model.kakaoLogin,
                    child: Container(
                      width: context.width * 0.9,
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE812),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "카카오톡으로 로그인",
                        style: FontSystem.button,
                      ),
                    ),
                  ),
          ],
        ),
      )),
    );
  }
}

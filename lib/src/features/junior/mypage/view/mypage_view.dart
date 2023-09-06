import 'package:flutter/material.dart';
import 'package:seenear/core/base/view/base_view.dart';
import 'package:seenear/core/extension/string_extension.dart';
import 'package:seenear/core/utils/utils.dart';
import 'package:seenear/src/common_widgets/commons.dart';
import 'package:seenear/src/constants/colors.dart';
import 'package:seenear/src/constants/fonts.dart';
import 'package:seenear/src/features/junior/mypage/view_model/mypage_view_model.dart';

class MypageView extends StatelessWidget {
  const MypageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<MypageViewModel>(
      viewModel: MypageViewModel(),
      onModelReady: (model) => {model.init(), model.setContext(context)},
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: ColorSystem.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  profileInfoWidget(model),
                  const CustomDivider(height: 12),
                  appInfoWidget(),
                  const CustomDivider(height: 12),
                  accountManageCardWidget(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget profileInfoWidget(model) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Column(children: [
        Image.asset(
          'blue_profile'.toImage,
          width: 140,
          height: 140,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            model.nickname,
            style: FontSystem.button.copyWith(color: FontColor.brown100),
          ),
        ),
      ]),
    );
  }

  Widget appInfoWidget() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text("앱 정보",
                style: FontSystem.body1.copyWith(color: FontColor.brown100)),
          ),
          ListTile(
            title: const Text("서비스 이용 약관", style: FontSystem.body2),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => urlLauncher("https://www.naver.com"),
          ),
          const ListTile(
            title: Text("개인 정보 처리 방침", style: FontSystem.body2),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          const ListTile(
            title: Text("오픈 소스 사용 정보", style: FontSystem.body2),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }

  Widget accountManageCardWidget() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListTile(
            title: Text("계정 관리", style: FontSystem.body1),
          ),
          const ListTile(
            title: Text("로그아웃", style: FontSystem.body2),
          ),
          ListTile(
            title: Text("회원 탈퇴",
                style: FontSystem.caption.copyWith(color: FontColor.brown40)),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seenear/core/base/view/base_view.dart';
import 'package:seenear/core/extension/context_extension.dart';
import 'package:seenear/core/extension/string_extension.dart';
import 'package:seenear/src/constants/fonts.dart';
import 'package:seenear/src/features/junior/auth/edit_nickname/view_model/edit_nickname_view_model.dart';
import 'package:seenear/src/constants/colors.dart';

class EditNicknameView extends StatelessWidget {
  const EditNicknameView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<EditNicknameViewModel>(
      viewModel: EditNicknameViewModel(),
      onModelReady: (viewmodel) => {viewmodel.init()},
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox.shrink(),
              Column(
                children: [
                  SvgPicture.asset('seenear_yellow'.toSVG),
                  Container(
                    width: context.width * 0.7,
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextField(
                      style: FontSystem.button,
                      controller: model.textController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "닉네임을 입력해주세요.",
                        hintStyle: FontSystem.button,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorSystem.font.brown60,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorSystem.font.brown60,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "최대 10자까지 가능해요.(특수문자 사용불가)",
                    style: FontSystem.caption
                        .copyWith(color: ColorSystem.font.brown40),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => model.onFinish(context),
                child: Container(
                  width: context.width * 0.9,
                  height: 56,
                  decoration: BoxDecoration(
                    color: ColorSystem.point.yellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "완료",
                    style: FontSystem.button
                        .copyWith(color: ColorSystem.font.brown60),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

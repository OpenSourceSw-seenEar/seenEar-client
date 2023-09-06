import 'package:flutter/material.dart';
import 'package:seenear/core/base/view/base_view.dart';
import 'package:seenear/src/common_widgets/custom_app_bar.dart';
import 'package:seenear/src/constants/colors.dart';
import 'package:seenear/src/constants/fonts.dart';
import 'package:seenear/src/features/senior/intro/edit_nickname/edit_nickname_view_model.dart';

class EditNicknameScreen extends StatelessWidget {
  const EditNicknameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<EditNicknameViewModel>(
      viewModel: EditNicknameViewModel(),
      onModelReady: (model) => model.setContext(context),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(255, 251, 242, 1),
          appBar: const CustomAppBar(
            title: "성함 입력하기",
            backgroundColor: ColorSystem.backgroundLightOrange,
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "청년들이",
                      style: TextStyle(
                        color: Color.fromRGBO(77, 62, 26, 1),
                        fontSize: 32,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "알 수 있도록",
                      style: TextStyle(
                        color: Color.fromRGBO(77, 62, 26, 1),
                        fontSize: 32,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "이름을 알려주세요.",
                      style: TextStyle(
                        color: Color.fromRGBO(77, 62, 26, 1),
                        fontSize: 32,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      TextField(
                        controller: model.textEditingController,
                        textAlign: TextAlign.center,
                        style: SeniorFont.body,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.all(30),
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(228, 170, 18, 1),
                                width: 1), // 활성화되지 않았을 때의 테두리 색상
                          ),
                          hintText: '이 곳을 터치하여\n성함을 입력해주세요.',
                          hintMaxLines: 2,
                          hintStyle: SeniorFont.body,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "이 이름은 이후 청년들에게 조언 카드와 함께 전달돼요",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(184, 178, 167, 1),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          bottomSheet: GestureDetector(
            onTap: () => model.onTapConfirm(context),
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: model.isButtonEnabled
                    ? ColorSystem.orange
                    : ColorSystem.lightYellow,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              height: 72,
              child: GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text(
                    "완료",
                    textAlign: TextAlign.center,
                    style: SeniorFont.button.copyWith(
                      color: model.isButtonEnabled
                          ? FontColor.brown100
                          : FontColor.brown60,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

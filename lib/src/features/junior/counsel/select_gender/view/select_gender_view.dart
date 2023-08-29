import "package:flutter/material.dart";
import 'package:seenear/core/base/view/base_view.dart';
import "package:seenear/core/extension/context_extension.dart";
import "package:seenear/core/extension/string_extension.dart";
import "package:seenear/src/common_widgets/custom_app_bar.dart";
import "package:seenear/src/constants/colors.dart";
import "package:seenear/src/constants/fonts.dart";
import "package:seenear/src/features/junior/counsel/select_gender/view_model/select_gender_view_model.dart";

class SelectGenderView extends StatelessWidget {
  final String worryCategory;
  const SelectGenderView({required this.worryCategory, super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SelectGenderViewModel>(
      viewModel: SelectGenderViewModel(),
      onModelReady: (viewModel) {
        viewModel.setContext(context);
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: const CustomAppBar(
            title: "이야기 상대 선택하기",
            backgroundColor: ColorSystem.backgroundLightOrange,
          ),
          backgroundColor: ColorSystem.backgroundLightOrange,
          body: Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$worryCategory 고민에 대해\n누구와 이야기 해볼까요?",
                  style: FontSystem.title.copyWith(
                    color: ColorSystem.font.brown100,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _selectGenderButton("grandmother".toImage, () {}, context),
                    _selectGenderButton("grandfather".toImage, () {}, context),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _selectGenderButton(
      String imagePath, Function() onTap, BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.width * 0.4,
        height: context.width * 0.4,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: ColorSystem.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Image.asset(imagePath),
      ),
    );
  }
}

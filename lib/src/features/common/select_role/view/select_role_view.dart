import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seenear/core/base/view/base_view.dart';
import 'package:seenear/core/extension/context_extension.dart';
import 'package:seenear/core/extension/string_extension.dart';
import 'package:seenear/src/constants/colors.dart';
import 'package:seenear/src/constants/fonts.dart';
import 'package:seenear/src/features/common/select_role/view_model/select_role_view_model.dart';

class SelectRoleView extends StatelessWidget {
  const SelectRoleView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SelectRoleViewModel>(
      viewModel: SelectRoleViewModel(),
      onModelReady: (viewmodel) => {},
      builder: (context, model, child) => Scaffold(
        backgroundColor: ColorSystem.backgroundLightOrange,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "반가워요!\n당신을 나타내는 말은\n둘 중 무엇인가요?",
                  style: FontSystem.titleBold,
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    selectRoleButton(context, () => model.onTapSenior(context),
                        "경험이 많은 노인", "senior".toSVG),
                    selectRoleButton(context, () => model.onTapJunior(context),
                        "조언이 필요한 청년", "junior".toSVG),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget selectRoleButton(
      BuildContext context, Function() onTap, String text, String iconPath) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.width - 40,
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: ColorSystem.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorSystem.darkOrange),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            SvgPicture.asset(iconPath),
            Text(text, style: SeniorFont.button),
          ],
        ),
      ),
    );
  }
}

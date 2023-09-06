import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seenear/core/base/view/base_view.dart';
import 'package:seenear/core/extension/string_extension.dart';
import 'package:seenear/src/common_widgets/custom_app_bar.dart';
import 'package:seenear/src/constants/colors.dart';
import 'package:seenear/src/constants/fonts.dart';
import 'package:seenear/src/features/senior/intro/select_gender/select_gender_view_model.dart';

class SelectGenderScreen extends StatelessWidget {
  const SelectGenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SelectGenderViewModel>(
      viewModel: SelectGenderViewModel(),
      onModelReady: (model) => model.setContext(context),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(255, 251, 242, 1),
          appBar: const CustomAppBar(
            title: "성별 고르기",
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
                      "성별을",
                      style: TextStyle(
                        color: Color.fromRGBO(77, 62, 26, 1),
                        fontSize: 32,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "알려주세요.",
                      style: TextStyle(
                        color: Color.fromRGBO(77, 62, 26, 1),
                        fontSize: 32,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        roleSelectionContainer(
                          context,
                          () => model.onTapSeniorFemale(context),
                          '여자',
                          SvgPicture.asset('grandmother'.toSVG),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        roleSelectionContainer(
                          context,
                          () => model.onTapSeniorMale(context),
                          '남자',
                          SvgPicture.asset('grandfather'.toSVG),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomSheet: Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 251, 242, 1),
            ),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 100,
                      child: SvgPicture.asset('seenEAR'.toSVG),
                    ),
                  ],
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: SvgPicture.asset('bottomLogo'.toSVG),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget roleSelectionContainer(
  BuildContext context,
  Function() onTap,
  String role,
  SvgPicture svgAssetPath,
) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SvgPicture.asset(svgAssetPath),
          svgAssetPath,
          Text(
            role,
            style: SeniorFont.button,
          )
        ],
      ),
    ),
  );
}

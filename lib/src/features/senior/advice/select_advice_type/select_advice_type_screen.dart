import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seenear/core/base/view/base_view.dart';
import 'package:seenear/core/extension/string_extension.dart';
import 'package:seenear/src/constants/colors.dart';
import 'package:seenear/src/constants/fonts.dart';
import 'package:seenear/src/features/senior/advice/select_advice_type/select_advice_type_view_model.dart';

class SelectAdviceTypeScreen extends StatelessWidget {
  const SelectAdviceTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SelectAdviceTypeViewModel>(
      viewModel: SelectAdviceTypeViewModel(),
      onModelReady: (model) => model.setContext(context),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(255, 251, 242, 1),
          appBar: AppBar(
            title: const Text("조언해주기"),
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          "감사의 의미로",
                          style: TextStyle(
                            color: Color.fromRGBO(77, 62, 26, 1),
                            fontSize: 32,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "편지를 남겼어요",
                          style: TextStyle(
                            color: Color.fromRGBO(77, 62, 26, 1),
                            fontSize: 32,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.42,
                          padding: const EdgeInsets.only(top: 34, bottom: 20),
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorSystem.darkOrange),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(children: [
                            SvgPicture.asset('seniorTypeStory'.toSVG),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              '새로운 편지가',
                              style: SeniorFont.button,
                            ),
                            const Text(
                              '도착했어요.',
                              style: SeniorFont.button,
                            )
                          ]),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.42,
                          padding: const EdgeInsets.only(top: 34, bottom: 20),
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorSystem.darkOrange),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(children: [
                            SvgPicture.asset('seniorTypeShort'.toSVG),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              '새로운 편지가',
                              style: SeniorFont.button,
                            ),
                            const Text(
                              '도착했어요.',
                              style: SeniorFont.button,
                            )
                          ]),
                        ),
                      ),
                    ],
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

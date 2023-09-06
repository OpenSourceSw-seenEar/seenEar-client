import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seenear/core/base/view/base_view.dart';
import 'package:seenear/core/extension/string_extension.dart';
import 'package:seenear/src/common_widgets/custom_app_bar.dart';
import 'package:seenear/src/constants/colors.dart';
import 'package:seenear/src/features/senior/intro/select_types/select_types_view_model.dart';

class SelectTypesScreen extends StatelessWidget {
  const SelectTypesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SelectTypesViewModel>(
      viewModel: SelectTypesViewModel(),
      onModelReady: (model) => model.setContext(context),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(255, 251, 242, 1),
          appBar: const CustomAppBar(
            title: "메인 화면",
            backgroundColor: ColorSystem.backgroundLightOrange,
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "고민하는",
                        style: TextStyle(
                          color: Color.fromRGBO(77, 62, 26, 1),
                          fontSize: 32,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "청년들에게",
                        style: TextStyle(
                          color: Color.fromRGBO(77, 62, 26, 1),
                          fontSize: 32,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "지혜를 나눠주세요.",
                        style: TextStyle(
                          color: Color.fromRGBO(77, 62, 26, 1),
                          fontSize: 32,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () => model.onTapRecodeVioce(context),
                          child: Container(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(228, 170, 18, 1))),
                            child: Column(
                              children: [
                                SizedBox(
                                  child: SvgPicture.asset('juniors'.toSVG),
                                ),
                                const Text(
                                  "고민하고 있는",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Color.fromRGBO(77, 62, 26, 1),
                                  ),
                                ),
                                const Text(
                                  "청년들에게 조언해주기",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Color.fromRGBO(77, 62, 26, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () => model.onTapThanklist(context),
                          child: Container(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(228, 170, 18, 1))),
                            child: Column(
                              children: [
                                SizedBox(
                                  child: SvgPicture.asset('mail'.toSVG),
                                ),
                                const Text(
                                  "고민을 해결한",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Color.fromRGBO(77, 62, 26, 1),
                                  ),
                                ),
                                const Text(
                                  "청년이 보낸 감사편지 보기",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Color.fromRGBO(77, 62, 26, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

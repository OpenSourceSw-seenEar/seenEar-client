import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seenear/core/base/view/base_view.dart';
import 'package:seenear/core/extension/string_extension.dart';
import 'package:seenear/src/constants/colors.dart';
import 'package:seenear/src/constants/fonts.dart';
import 'package:seenear/src/features/senior/advice/record_finish/record_finish_view_model.dart';

class RecordFinishScreen extends StatelessWidget {
  const RecordFinishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<RecordFinishViewModel>(
        viewModel: RecordFinishViewModel(),
        onModelReady: (model) => model.setContext(context),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: ColorSystem.backgroundLightOrange,
            appBar: AppBar(
              title: const Text("내 이야기 들려주기"),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child:
                                const Text("소중한 이야기가", style: SeniorFont.title),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: const Text("성공적으로 녹음됐어요!",
                                style: SeniorFont.title),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SvgPicture.asset('recordCard'.toSVG),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: ColorSystem.darkOrange,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        width: double.infinity,
                        height: 72,
                        child: const Text(
                          "녹음된 내용 듣기",
                          style: SeniorFont.body,
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () => model.onTapRecodeVoice(context),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: ColorSystem.darkOrange,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          width: double.infinity,
                          height: 72,
                          child: const Text(
                            "다시 녹음하기",
                            style: SeniorFont.body,
                          ),
                        ),
                      ),
                      const SizedBox(height: 80),
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
        });
  }
}

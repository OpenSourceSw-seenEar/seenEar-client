import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seenear/core/base/view/base_view.dart';
import 'package:seenear/core/extension/string_extension.dart';
import 'package:seenear/src/constants/colors.dart';
import 'package:seenear/src/constants/fonts.dart';
import 'package:seenear/src/features/senior/advice/record_proceed/record_proceed_view_model.dart';

class RecordProceedScreen extends StatelessWidget {
  const RecordProceedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<RecordProceedViewModel>(
      viewModel: RecordProceedViewModel(),
      onModelReady: (model) => model.setContext(context),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("내 이야기 들려주기"),
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
                        child: const Text("아래 버튼을 눌러", style: SeniorFont.title),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text("청년들에게 자신의", style: SeniorFont.title),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child:
                            const Text("이야기를 들려주세요.", style: SeniorFont.title),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  GestureDetector(
                    onTap: () => model.onTapRecodeFinish(context),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset('heart'.toSVG),
                        const Text(
                          "말하기",
                          style: SeniorFont.titleSubtitle,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "열심히 듣고 있어요...",
                    style: SeniorFont.body.copyWith(
                      color: FontColor.brown100,
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomSheet: Container(
            color: Colors.white,
            height: 50,
            alignment: Alignment.topCenter,
            child: SvgPicture.asset('seenEAR'.toSVG),
          ),
        );
      },
    );
  }
}

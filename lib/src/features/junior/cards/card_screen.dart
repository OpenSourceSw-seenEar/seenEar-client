import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seenear/core/base/view/base_view.dart';
import 'package:seenear/core/extension/string_extension.dart';
import 'package:seenear/src/common_widgets/custom_app_bar.dart';
import 'package:seenear/src/constants/colors.dart';
import 'package:seenear/src/constants/fonts.dart';
import 'package:seenear/src/features/junior/cards/card_screen_view_model.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<CardScreenViewModel>(
      viewModel: CardScreenViewModel(),
      onModelReady: (model) => {model.init(), model.setContext(context)},
      builder: (context, model, child) {
        return Scaffold(
          appBar: const CustomAppBar(title: ""),
          body: Column(
            children: [
              const Text("Name님이 저장한\n조언 카드만 모아봤어요.", style: FontSystem.title),
              const Row(
                children: [Text("고민 종류"), Text("조언 종류")],
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: 9,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  itemBuilder: (context, index) {
                    return _card("반가워요");
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _card(String text) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorSystem.point.lightYellow,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset('card'.toSVG),
            Text(text,
                style: FontSystem.body1
                    .copyWith(color: ColorSystem.font.brown100)),
          ],
        ),
      ),
    );
  }
}

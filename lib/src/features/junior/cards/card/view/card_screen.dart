import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seenear/core/base/view/base_view.dart';
import 'package:seenear/core/extension/string_extension.dart';
import 'package:seenear/src/constants/colors.dart';
import 'package:seenear/src/constants/fonts.dart';
import 'package:seenear/src/features/junior/cards/card/view_model/card_screen_view_model.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<CardScreenViewModel>(
      viewModel: CardScreenViewModel(),
      onModelReady: (model) => {model.init(), model.setContext(context)},
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text("${model.nickname}님이 저장한\n조언 카드만 모아봤어요.",
                      style: FontSystem.title),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    children: [
                      const Text("고민 종류", style: FontSystem.caption),
                      _customDropDownButton(model.onChangeWorryType,
                          model.worryType, model.worryTypeList),
                      const Text(
                        "조언 종류",
                        style: FontSystem.caption,
                      ),
                      _customDropDownButton(model.onChangeAdviceType,
                          model.adviceType, model.adviceTypeList),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: 9,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    itemBuilder: (context, index) {
                      return _card("반가워요", model.onTapCard);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _customDropDownButton(
      void Function(String?) onChange, String value, List<String> items) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorSystem.orange),
        borderRadius: BorderRadius.circular(5),
      ),
      height: 30,
      width: 80,
      margin: const EdgeInsets.fromLTRB(10, 0, 20, 0),
      child: DropdownButton(
        onChanged: (value) => onChange(value),
        value: value,
        underline: Container(),
        style: FontSystem.caption,
        icon: const Icon(Icons.keyboard_arrow_down),
        isExpanded: true,
        padding: const EdgeInsets.all(3),
        items: items
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e, style: FontSystem.caption),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _card(String text, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: PointColor.lightYellow,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset('card'.toSVG),
              Text(text,
                  style: FontSystem.body1.copyWith(color: FontColor.brown100)),
            ],
          ),
        ),
      ),
    );
  }
}

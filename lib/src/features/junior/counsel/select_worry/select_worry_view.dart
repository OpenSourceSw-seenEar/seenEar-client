import 'package:flutter/material.dart';
import 'package:seenear/core/base/view/base_view.dart';
import 'package:seenear/core/extension/context_extension.dart';
import 'package:seenear/core/extension/string_extension.dart';
import 'package:seenear/src/constants/colors.dart';
import 'package:seenear/src/constants/fonts.dart';
import 'package:seenear/src/features/junior/counsel/select_worry/select_worry_view_model.dart';

class SelectWorryView extends StatelessWidget {
  const SelectWorryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SelectWorryViewModel>(
      viewModel: SelectWorryViewModel(),
      onModelReady: (model) => {model.init(), model.setContext(context)},
      builder: (context, model, child) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _logo(context),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                child: Text(
                  "${model.nickname}님의\n고민은 무엇인가요?",
                  style: FontSystem.title.copyWith(
                    color: FontColor.brown100,
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: 9,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  itemBuilder: (context, index) {
                    return _worryButton(
                      () =>
                          model.onTapWorryCategory(model.worryCategory[index]),
                      model.worryCategory[index],
                      model.worryCategoryImagePath[index].toImage,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _logo(BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      decoration: BoxDecoration(
        color: ColorSystem.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.asset(
            'select_worry'.toImage,
            width: 250,
          ),
        ],
      ),
    );
  }

  Widget _worryButton(Function() onTap, String text, String imagePath) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorSystem.backgroundLightOrange,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 1),
              blurRadius: 3,
            ),
          ],
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            imagePath,
            width: 40,
            height: 40,
          ),
          Text(text),
        ]),
      ),
    );
  }
}

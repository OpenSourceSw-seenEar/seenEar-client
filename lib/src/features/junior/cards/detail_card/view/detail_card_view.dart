import 'package:flutter/material.dart';
import 'package:seenear/core/base/view/base_view.dart';
import 'package:seenear/core/extension/context_extension.dart';
import 'package:seenear/core/extension/string_extension.dart';
import 'package:seenear/src/common_widgets/appbar.dart';
import 'package:seenear/src/constants/colors.dart';
import 'package:seenear/src/constants/fonts.dart';
import 'package:seenear/src/features/junior/cards/detail_card/view_model/detail_card_view_model.dart';

class DetailCardView extends StatelessWidget {
  const DetailCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<DetailCardViewModel>(
      viewModel: DetailCardViewModel(),
      onModelReady: (model) => {model.init(), model.setContext(context)},
      builder: (context, model, child) {
        return Scaffold(
            appBar: const CustomAppBar(
              title: "받은 카드 확인하기",
              backgroundColor: ColorSystem.backgroundLightOrange,
            ),
            backgroundColor: ColorSystem.backgroundLightOrange,
            body: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('card_background'.toImage,
                    width: context.width, fit: BoxFit.cover),
                _cardView(
                    "심상현",
                    "편지 내용이 들어갑니다. 글씨체 수정이 필요할 거 같아요 왼쪽 플로우 차트에 글씨체 몇 개를 추려서 올려놨는데 회의 때 같이 이야기 해보면 좋을 것 같습니다. 편지지 글자 수 제한이 필요할까요? 다만 고민되는 것은 노인 분들은 말을 하기 때문에 얼마나 말을 길게 할지 몰라서 글자 수를 예상하기 힘들다는 거예요.",
                    "김춘자"),
              ],
            ));
      },
    );
  }

  Widget _cardView(String reciever, String text, String writer) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "To. $reciever",
            style: FontSystem.card,
          ),
          Text(
            text,
            style: FontSystem.card,
          ),
          Text(
            "From. $writer 할머니가",
            style: FontSystem.card,
          ),
        ],
      ),
    );
  }
}

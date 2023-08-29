import 'package:flutter/material.dart';
import 'package:seenear/core/base/view/base_view.dart';
import 'package:seenear/src/features/junior/mypage/view_model/mypage_view_model.dart';

class MypageView extends StatelessWidget {
  const MypageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<MypageViewModel>(
      viewModel: MypageViewModel(),
      onModelReady: (model) => {model.init(), model.setContext(context)},
      builder: (context, model, child) {
        return const Scaffold(
          body: Center(
            child: Text('MypageView'),
          ),
        );
      },
    );
  }
}

import "package:flutter/material.dart";
import 'package:seenear/core/base/view/base_view.dart';
import "package:seenear/src/features/junior/counsel/select_gender/view_model/select_gender_view_model.dart";

class SelectGenderScreen extends StatelessWidget {
  const SelectGenderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SelectGenderViewModel>(
      onModelReady: (viewModel) {
        viewModel.setContext(context);
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('SelectGender'),
          ),
          body: Container(),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seenear/core/base/view/base_view.dart';
import 'package:seenear/core/extension/string_extension.dart';
import 'package:seenear/src/features/common/splash/viewmodel/splash_view_model.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      onModelReady: (model) => model.setContext(context),
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: SvgPicture.asset('splash'.toSVG),
          ),
        );
      },
    );
  }
}

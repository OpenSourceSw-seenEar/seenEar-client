import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seenear/core/base/view/base_view.dart';
import 'package:seenear/core/extension/string_extension.dart';
import 'package:seenear/src/constants/colors.dart';
import 'package:seenear/src/constants/fonts.dart';
import 'package:seenear/src/features/senior/listen_thank/check_thank_list/check_thank_list_view_model.dart';

class CheckThankListScreen extends StatelessWidget {
  const CheckThankListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<CheckThankListViewModel>(
      viewModel: CheckThankListViewModel(),
      onModelReady: (model) => model.setContext(context),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(255, 251, 242, 1),
          appBar: AppBar(
            title: const Text("이름 입력하기"),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                "청년들이",
                                style: TextStyle(
                                  color: Color.fromRGBO(77, 62, 26, 1),
                                  fontSize: 32,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                "감사의 의미로",
                                style: TextStyle(
                                  color: Color.fromRGBO(77, 62, 26, 1),
                                  fontSize: 32,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                "편지를 남겼어요",
                                style: TextStyle(
                                  color: Color.fromRGBO(77, 62, 26, 1),
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SvgPicture.asset('happyLogo'.toSVG),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 34, bottom: 20, left: 34, right: 34),
                              decoration: BoxDecoration(
                                color: ColorSystem.orange,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(children: [
                                SvgPicture.asset('letter'.toSVG),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  '새로운 편지가',
                                  style: SeniorFont.caption,
                                ),
                                const Text(
                                  '도착했어요.',
                                  style: SeniorFont.caption,
                                )
                              ]),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 34, bottom: 20, left: 34, right: 34),
                              decoration: BoxDecoration(
                                color: ColorSystem.orange,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(children: [
                                SvgPicture.asset('letter'.toSVG),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  '새로운 편지가',
                                  style: SeniorFont.caption,
                                ),
                                const Text(
                                  '도착했어요.',
                                  style: SeniorFont.caption,
                                )
                              ]),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 34, bottom: 20, left: 34, right: 34),
                              decoration: BoxDecoration(
                                color: ColorSystem.lightYellow,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                children: [
                                  SvgPicture.asset('whiteMail'.toSVG),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    '이미 읽은',
                                    style: SeniorFont.caption,
                                  ),
                                  const Text(
                                    '편지예요.',
                                    style: SeniorFont.caption,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 34, bottom: 20, left: 34, right: 34),
                              decoration: BoxDecoration(
                                color: ColorSystem.lightYellow,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                children: [
                                  SvgPicture.asset('whiteMail'.toSVG),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    '이미 읽은',
                                    style: SeniorFont.caption,
                                  ),
                                  const Text(
                                    '편지예요.',
                                    style: SeniorFont.caption,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
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

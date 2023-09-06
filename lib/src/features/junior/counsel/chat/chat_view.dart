import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:seenear/core/base/view/base_view.dart';
import 'package:seenear/src/common_widgets/commons.dart';
import 'package:seenear/src/constants/colors.dart';
import 'package:seenear/src/constants/enums/chat_person_enum.dart';
import 'package:seenear/src/constants/fonts.dart';
import 'package:seenear/src/features/junior/counsel/chat/chat_bubble.dart';
import 'package:seenear/src/features/junior/counsel/chat/chat_model.dart';

import 'package:seenear/src/features/junior/counsel/chat/chat_view_model.dart';
import 'package:collection/collection.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ChatViewModel>(
      viewModel: ChatViewModel(),
      onModelReady: (model) => {model.init(), model.setContext(context)},
      builder: (context, model, child) {
        return Scaffold(
          appBar: CustomAppBar(
            title: model.seniorNickname,
            backgroundColor: ColorSystem.backgroundLightOrange,
          ),
          backgroundColor: ColorSystem.backgroundLightOrange,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ListView.builder(
                itemCount: model.chatList.length,
                padding: const EdgeInsets.only(bottom: 30),
                itemBuilder: (context, index) {
                  if (model.chatList[index].personType ==
                      ChatPersonType.senior) {
                    return _seniorChat(
                      context,
                      model.seniorNickname,
                      model.chatList[index].message,
                      model.chatList[index].time,
                    );
                  }

                  return _juniorChat(model.chatList[index].message[0],
                      model.chatList[index].time);
                },
              ),
              model.isLoading
                  ? GestureDetector(
                      onTap: () {
                        model.addChat(
                          ChatModel(
                            personType: ChatPersonType.senior,
                            message:
                                model.seniorChatList[model.seniorChatIndex],
                            time: DateTime.now(),
                          ),
                        );
                        model.seniorChatIndex++;
                      },
                      child: const CircularProgressIndicator())
                  : _juniorInput(
                      model,
                      model.juniorChatList[model.juniorChatIndex].$1,
                      model.juniorChatList[model.juniorChatIndex].$2),
              model.isEnding
                  ? _endingDialog(context, model)
                  : const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }

  Widget _endingDialog(BuildContext context, ChatViewModel model) {
    return Container(
      child: Text("종료"),
    );
  }

  Widget _seniorChat(BuildContext context, String seniorNickname,
      List<String> contents, DateTime time) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
              ),
              SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: contents.mapIndexed<Widget>((index, value) {
                    return Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: CustomSeniorChatBubble(
                          context: context,
                          message: value,
                          isFirstChat: index == 0),
                    );
                  }).toList()
                    ..insert(0, Text(seniorNickname)),
                ),
              ),
            ],
          ),
          Text(
            DateFormat('a hh:mm', 'ko').format(time),
            style: FontSystem.caption,
          ),
        ],
      ),
    );
  }

  Widget _juniorChat(String message, DateTime time) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            DateFormat('a hh:mm', 'ko').format(DateTime.now()),
            style: FontSystem.caption,
          ),
          CustomJuniorChatBubble(
            context: context,
            message: message,
          ),
        ],
      ),
    );
  }

  Widget _juniorInput(
      ChatViewModel viewModel, List<String> contents, Function() onTap) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(bottom: 20),
      physics: const NeverScrollableScrollPhysics(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: contents
            .map((e) => GestureDetector(
                  onTap: () {
                    viewModel.addChat(
                      ChatModel(
                        personType: ChatPersonType.junior,
                        message: [e],
                        time: DateTime.now(),
                      ),
                    );
                    onTap();
                    viewModel.juniorChatIndex++;
                  },
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      decoration: BoxDecoration(
                        color: ColorSystem.white,
                        border: Border.all(color: ColorSystem.orange),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 1),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: Text(e)),
                ))
            .toList(),
      ),
    );
  }
}

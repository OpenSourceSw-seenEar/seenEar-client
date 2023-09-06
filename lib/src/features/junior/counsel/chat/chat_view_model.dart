import 'package:provider/provider.dart';
import 'package:seenear/common/providers/global_provider.dart';
import 'package:seenear/core/base/model/base_view_model.dart';
import 'package:seenear/src/constants/enums/chat_person_enum.dart';
import 'package:seenear/src/constants/enums/gender_enum.dart';
import 'package:seenear/src/features/junior/counsel/chat/chat_model.dart';

class ChatViewModel extends BaseViewModel {
  bool _isLoading = false;
  bool _isEnding = false;
  ChatPersonType turn = ChatPersonType.senior;
  List<List<String>> seniorChatList = [];
  List<(List<String>, Function())> juniorChatList = [];
  List<String> juniorChat = [];
  int seniorChatIndex = 0;
  int juniorChatIndex = 0;

  List<ChatModel> chatList = [];

  @override
  void init() {}

  @override
  void setContext(context) {
    viewModelContext = context;
    final nickname = Provider.of<GlobalProvider>(viewModelContext).nickname;
    final worryCategory =
        Provider.of<GlobalProvider>(viewModelContext).worryCategory;
    seniorChatList = [
      ["$nickname이 왔니?", "$nickname(이)가 $worryCategory에 고민이 있어서 왔구나."],
      ["그렇다면", "그렇다면 지금 너에게 이 이야기가 도움이 될 것 같구나.", "이 카드를 뒤집어보지 않으련?", "Image"],
      ["어때 좀 도움이 됐니?"],
      ["나한테 답장을 써주지 않으련?", "$nickname의 답장을 받으면 참 보람찰 것 같구나."],
      ["정말 고맙구나.", "앞으로도 고민이 있을 땐 언제든지 나를 찾아주렴."]
    ];
    juniorChatList = [
      (["네 맞아요ㅠㅠ"], () => {}),
      (["🥰", "😀", "🥹", "😭", "😕"], () => {}),
      (["큰 도움이 됐어요. 감사합니다ㅎㅎ", "조금 아쉬웠어요."], () => {}),
      (
        [],
        () => {
              _isEnding = true,
              notifyListeners(),
            }
      ),
      ([], () => {})
    ];
    juniorChat = ["네 맞아요 ㅠㅠ"];

    chatList.add(
      ChatModel(
        personType: ChatPersonType.senior,
        message: seniorChatList[seniorChatIndex],
        time: DateTime.now(),
      ),
    );
    seniorChatIndex++;
  }

  String get seniorNickname =>
      (Provider.of<GlobalProvider>(viewModelContext).genderType ==
              GenderType.grandMother)
          ? "교훈 주는 할머니"
          : "교훈 주는 할아버지";

  bool get isLoading => _isLoading;

  bool get isEnding => _isEnding;

  void addChat(ChatModel chat) {
    chatList.add(chat);
    _isLoading = !_isLoading;
    notifyListeners();
  }
}

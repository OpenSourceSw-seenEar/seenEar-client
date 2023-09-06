import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:seenear/common/providers/global_provider.dart';
import 'package:seenear/core/base/model/base_view_model.dart';

class CardScreenViewModel extends BaseViewModel {
  @override
  void init() {}

  @override
  void setContext(context) {
    viewModelContext = context;
  }

  String get nickname =>
      Provider.of<GlobalProvider>(viewModelContext, listen: false).nickname;

  String worryType = "전체";
  void onChangeWorryType(String? value) {
    worryType = value ?? "전체";
    notifyListeners();
  }

  List<String> worryTypeList = ["전체", "가족", "학교", "친구", "연애", "기타"];

  String adviceType = "전체";
  void onChangeAdviceType(String? value) {
    adviceType = value ?? "전체";
    notifyListeners();
  }

  List<String> adviceTypeList = ["전체", "경험", "한 마디"];

  void onTapCard() {
    viewModelContext.push('/card/detailCard');
  }
}

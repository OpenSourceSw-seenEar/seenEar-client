import 'package:flutter/material.dart';
import 'package:seenear/src/constants/enums/gender_enum.dart';

class GlobalProvider extends ChangeNotifier {
  String _nickname = "세현";
  String get nickname => _nickname;

  GenderType _genderType = GenderType.grandFather;
  GenderType get genderType => _genderType;

  String _worryCategory = "꿈";
  String get worryCategory => _worryCategory;

  void setNickname(String nickname) {
    _nickname = nickname;
    notifyListeners();
  }

  void setGenderType(GenderType type) {
    _genderType = type;
    notifyListeners();
  }

  void setWorryCategory(String worryCategory) {
    _worryCategory = worryCategory;
    notifyListeners();
  }
}

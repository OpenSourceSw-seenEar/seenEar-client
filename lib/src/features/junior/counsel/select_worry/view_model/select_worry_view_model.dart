import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seenear/core/base/model/base_view_model.dart';

class SelectWorryViewModel extends BaseViewModel {
  @override
  void init() {}

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  List<String> worryCategory = [
    "인간관계",
    "가족",
    "건강",
    "결혼",
    "꿈/공부",
    "돈",
    "진로",
    "회사",
    "기타"
  ];
  List<String> worryCategoryImagePath = [
    "worry_relation",
    "worry_family",
    "worry_health",
    "worry_marriage",
    "worry_dream",
    "worry_money",
    "worry_career",
    "worry_company",
    "worry_etc"
  ];

  void onTapWorryCategory(String worryCategory) {
    viewModelContext.push('/selectWorry/selectGender/$worryCategory');
  }
}

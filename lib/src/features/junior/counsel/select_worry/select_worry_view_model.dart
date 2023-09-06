import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:seenear/common/providers/global_provider.dart';
import 'package:seenear/core/base/model/base_view_model.dart';
import 'package:seenear/src/constants/map/worry_map.dart';
import 'package:seenear/src/features/junior/counsel/select_gender/select_gender_model.dart';

class SelectWorryViewModel extends BaseViewModel {
  @override
  void init() {}

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  List<String> get worryCategory => worryTypeMap.keys.toList();
  List<String> get worryCategoryImagePath => worryTypeMap.values.toList();

  void onTapWorryCategory(String worryCategory) {
    viewModelContext.push('/selectWorry/worry',
        extra: SelectGenderModel(worryCategory: worryCategory));
  }

  String get nickname =>
      Provider.of<GlobalProvider>(viewModelContext, listen: false).nickname;
}

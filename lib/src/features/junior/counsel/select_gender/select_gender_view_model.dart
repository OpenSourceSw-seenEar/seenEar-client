import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:provider/provider.dart";
import "package:seenear/common/providers/global_provider.dart";
import "package:seenear/core/base/model/base_view_model.dart";
import "package:seenear/src/constants/enums/gender_enum.dart";

class SelectGenderViewModel extends BaseViewModel {
  @override
  void init() {
    // TODO: implement init
  }

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  void onTap(GenderType genderType) {
    Provider.of<GlobalProvider>(viewModelContext, listen: false)
        .setGenderType(genderType);
    viewModelContext.push('/chat');
  }
}

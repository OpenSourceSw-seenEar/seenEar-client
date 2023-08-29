import 'package:flutter/material.dart';
import 'package:seenear/core/network/network_manager.dart';

abstract class BaseViewModel extends ChangeNotifier {
  late BuildContext viewModelContext;
  final coreDio = NetworkManager.instance.coreDio;

  void setContext(BuildContext context);
  void init() {}
}

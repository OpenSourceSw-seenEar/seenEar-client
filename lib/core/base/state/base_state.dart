import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  double height(double value) => MediaQuery.of(context).size.height * value;
  double width(double value) => MediaQuery.of(context).size.width * value;
}

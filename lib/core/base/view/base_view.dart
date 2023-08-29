import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seenear/core/base/model/base_view_model.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T model)? onModelReady;
  final T viewModel;

  const BaseView(
      {super.key,
      required this.viewModel,
      required this.builder,
      required this.onModelReady});

  @override
  BaseViewState<T> createState() => BaseViewState<T>();
}

class BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  late T model;

  @override
  void initState() {
    model = widget.viewModel;

    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
    model.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}

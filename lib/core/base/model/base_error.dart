import 'package:seenear/core/network/response_model.dart';

class BaseError<T> extends IErrorModel<T> {
  BaseError(this.message);
  final String message;
}

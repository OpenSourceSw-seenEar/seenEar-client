import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:seenear/core/base/model/base_error.dart';
import 'package:seenear/core/base/model/base_model.dart';
import 'package:seenear/core/extension/network_extension.dart';
import 'package:seenear/core/network/response_model.dart';

import 'package:seenear/src/constants/enums/http_request_enum.dart';

part 'core_operation.dart';

class CoreDio with DioMixin implements Dio {
  CoreDio(this.options) {
    options = options;
    interceptors.add(InterceptorsWrapper());
    httpClientAdapter = IOHttpClientAdapter();
  }

  @override
  final BaseOptions options;

  Future<IResponseModel<R>> send<R, T>(
    String path, {
    required HttpTypes type,
    required BaseModel<T> parseModel,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final response = await request<dynamic>(
      path,
      data: data,
      options: Options(
        method: type.rawValue,
      ),
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final model = _responseParser<R, T>(parseModel, response.data);
        return ResponseModel<R>(data: model);
      default:
        return ResponseModel(error: BaseError('message'));
    }
  }
}

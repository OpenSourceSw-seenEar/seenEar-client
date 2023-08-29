import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:seenear/core/network/core_dio.dart';

class NetworkManager {
  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: dotenv.env['BASE_URL'] ?? '',
      headers: {
        'Content-Type': 'application/json',
      },
    );

    coreDio = CoreDio(baseOptions);
  }
  static NetworkManager? _instance;
  static NetworkManager get instance {
    return _instance ??= NetworkManager._init();
  }

  CoreDio? coreDio;
}

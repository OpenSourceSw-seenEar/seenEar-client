import "package:seenear/src/constants/enums/http_request_enum.dart";

extension NetworkTypeExtension on HttpTypes? {
  String get rawValue {
    switch (this) {
      case HttpTypes.get:
        return 'GET';
      case HttpTypes.post:
        return 'POST';
      default:
        throw 'ERROR TYPE';
    }
  }
}

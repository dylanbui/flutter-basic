
import '../../constants.dart';
import '../../utils/tuple.dart';

typedef ResultType<T> = Tuple<T?, BaseError?>;

enum NetworkType {
  GET, POST, PUT, DELETE
}

extension NetworkTypeExtension on NetworkType {

  String get name { return "demo thoi";}


  String toValue() {
    switch (this) {
      case NetworkType.POST:
        return "POST";
      case NetworkType.GET:
        return "GET";
      default:
        return "-1";
    }
  }
}

class NetworkError extends BaseError {
  NetworkError(int code, String message) : super(code, message);

  static const ERROR_NETWORK_CODE_UNKNOWN = '-1000';
  static const ERROR_NETWORK_CODE_PARSING = '-999';
}
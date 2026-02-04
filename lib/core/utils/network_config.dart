import 'package:third_project/core/enums/request_type.dart';

class NetworkConfig {
  static String BASE_API = '';

  static String getFullApiRoute(String apiRoute) {
    return BASE_API + apiRoute;
  }

  static Map<String, String> getHeaders({
    bool? needAuth = true,
    RequestType? requestType,
    Map<String, String>? extraHeaders = const {},
  }) {
    return {
      // if (needAuth!)
      //   "Authorization": "Bearer ${storage.getTokenInfo()?.accessToken ?? ''}",
      if (requestType != RequestType.GET) "Content-Type": "application/json",
      ...extraHeaders!,
    };
  }
}

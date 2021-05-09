import 'package:flutter/foundation.dart';

abstract class HttpClient {
  Future<void> request(
      {@required String url,
      @required String method,
      Map<String, String> body}) async {}
}

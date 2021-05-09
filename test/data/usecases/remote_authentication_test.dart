import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({
    @required this.httpClient,
    @required this.url,
  });

  Future<void> auth() async {
    await httpClient.request(url: this.url, method: 'post');
  }
}

abstract class HttpClient {
  Future<void> request({@required String url, @required String method}) async {}
}

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  RemoteAuthentication remoteAuthentication;
  HttpClientSpy httpClient;
  String url;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpsUrl();
    remoteAuthentication =
        RemoteAuthentication(httpClient: httpClient, url: url);
  });

  test('Should call HttpClient with correct values', () async {
    await remoteAuthentication.auth();

    verify(httpClient.request(url: url, method: 'post'));
  });
}

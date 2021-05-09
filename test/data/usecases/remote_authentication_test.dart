import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fordev/data/http/http.dart';
import 'package:fordev/data/usecases/usescases.dart';
import 'package:fordev/domain/usecases/usecases.dart';
import 'package:mockito/mockito.dart';

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
    var params = AuthenticationParams(
        email: faker.internet.email(), secret: faker.internet.password());

    await remoteAuthentication.auth(params);

    verify(httpClient.request(
        url: url,
        method: 'post',
        body: {'email': params.email, 'password': params.secret}));
  });
}

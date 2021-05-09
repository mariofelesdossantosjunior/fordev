import '../entities/entities.dart';

abstract class Authentication {
  Future<AccountEntity> auth({AuthenticationParams params});
}

class AuthenticationParams {
  final String email;
  final String secret;

  AuthenticationParams({this.email, this.secret});

  Map<String, String> toJson() =>
      {'email': this.email, 'password': this.secret};
}

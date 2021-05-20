
abstract class AuthenticationState {
  const AuthenticationState();

}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final String userId;

  Authenticated(this.userId);



  @override
  String toString() => "Authenticated {userId}";
}

class AuthenticatedButNotSet extends AuthenticationState {
  final String userId;

  AuthenticatedButNotSet(this.userId);

}

class Unauthenticated extends AuthenticationState {}

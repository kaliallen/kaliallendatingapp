import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'authentification_event.dart';
import 'authentification_state.dart';
import 'package:kaliallendatingapp/models/userRepository.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository, super(Uninitialized());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event,
      ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = await _userRepository.isSignedIn();
      if (isSignedIn) {
        final uid = await _userRepository.getUser();
        final isFirstTime = await _userRepository.isFirstTime(uid);

        if (!isFirstTime) {
          yield AuthenticatedButNotSet(uid);
          print(state);
        } else {
          yield Authenticated(uid);
          print(state);
        }
      } else {
        yield Unauthenticated();
        print(state);
      }
    } catch (_) {
      yield Unauthenticated();
      print(state);
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    final isFirstTime =
    await _userRepository.isFirstTime(await _userRepository.getUser());

    if (!isFirstTime) {
      yield AuthenticatedButNotSet(await _userRepository.getUser());
      print(state);
    } else {
      yield Authenticated(await _userRepository.getUser());
      print(state);
    }
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield Unauthenticated();
    print(state);
    _userRepository.signOut();
  }
}

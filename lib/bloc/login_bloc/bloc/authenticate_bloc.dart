import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:school_app/model/userModel.dart';
import 'package:school_app/repository/UserRepository.dart';

part 'authenticate_event.dart';
part 'authenticate_state.dart';

class AuthenticateBloc extends Bloc<AuthenticateEvent, AuthenticateState> {
  final UserRepository userRepository;

  AuthenticateBloc({@required this.userRepository})
      : assert(userRepository != null);

  @override
  Stream<AuthenticateState> mapEventToState(
    AuthenticateEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool hasRole = await userRepository.hasRole();

      if (hasRole) {
        yield AuthenticateAuthenticated(userModel: null);
      } else {
        yield AuthenticateUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticateLoading();
      await userRepository.persistRole(user: event.user);
      yield AuthenticateAuthenticated(userModel: event.user);
    }

    if (event is LoggedOut) {
      yield AuthenticateLoading();

      await userRepository.delteRole(id: 0);

      yield AuthenticateUnauthenticated();
    }
  }

  @override
  AuthenticateState get initialState => AuthenticateUninitialized();
}

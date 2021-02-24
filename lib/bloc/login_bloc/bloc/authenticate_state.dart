part of 'authenticate_bloc.dart';

abstract class AuthenticateState extends Equatable {
  const AuthenticateState();

  @override
  List<Object> get props => [];
}

class AuthenticateUninitialized extends AuthenticateState {}

class AuthenticateAuthenticated extends AuthenticateState {
  final UserModel userModel;
  AuthenticateAuthenticated({@required this.userModel});

  @override
  List<UserModel> get props => [userModel];
}

class AuthenticateUnauthenticated extends AuthenticateState {}

class AuthenticateLoading extends AuthenticateState {}

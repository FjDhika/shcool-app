import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/bloc/login/bloc/login_bloc.dart';
import 'package:school_app/bloc/login_bloc/bloc/authenticate_bloc.dart';
import 'package:school_app/components/login_form.dart';
import 'package:school_app/repository/UserRepository.dart';

class LoginPage extends StatelessWidget {
  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login | Home Hub'),
      ),
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticateBloc: BlocProvider.of<AuthenticateBloc>(context),
            userRepository: userRepository,
          );
        },
        child: LoginForm(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/bloc/login_bloc/bloc/authenticate_bloc.dart';
import 'package:school_app/pages/home_page.dart';
import 'package:school_app/pages/login_page.dart';
import 'package:school_app/repository/UserRepository.dart';

import 'components/loading_indicator.dart';

class MyBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
  }
}

void main() {
  BlocSupervisor.delegate = MyBlocDelegate();
  final userRepository = UserRepository();

  runApp(BlocProvider<AuthenticateBloc>(
    create: (context) {
      return AuthenticateBloc(userRepository: userRepository)
        ..add(AppStarted());
    },
    child: App(userRepository: userRepository),
  ));
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.dark,
      ),
      home: BlocBuilder<AuthenticateBloc, AuthenticateState>(
        builder: (context, state) {
          if (state is AuthenticateAuthenticated) {
            return HomePage(
              role: state.userModel.role,
            );
          }
          if (state is AuthenticateUnauthenticated) {
            return LoginPage(
              userRepository: userRepository,
            );
          }
          if (state is AuthenticateLoading) {
            return LoadingIndicator();
          }

          return LoginPage(
            userRepository: userRepository,
          );
        },
      ),
    );
  }
}

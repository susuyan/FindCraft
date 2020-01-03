import 'package:find_craft/application.dart';
import 'package:find_craft/pages/authentication/bloc.dart';
import 'package:find_craft/pages/home_page.dart';
import 'package:find_craft/pages/login/login_page.dart';
import 'package:find_craft/pages/splash_page.dart';
import 'package:find_craft/repositories/user_repository.dart';

import 'package:find_craft/route/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }
}

void main() {
  BlocSupervisor.delegate = AppBlocDelegate();

  final router = Router();
  Routes.configureRoutes(router);
  Application.router = router;

  runApp(BlocProvider<AuthenticationBloc>(
    create: (context) {
      return AuthenticationBloc(userRepository: UserRepository())..add(AppStarted());
    },
    child: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationUnauthenticated) {
          return LoginPage();
        }

        if (state is AuthenticationAuthenticated) {
          return HomePage();
        }

        return SplashPage();
      },
    ));
  }
}

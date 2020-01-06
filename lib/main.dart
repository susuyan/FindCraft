import 'package:find_craft/application.dart';
import 'package:find_craft/pages/authentication/bloc.dart';

import 'package:find_craft/pages/login/login_page.dart';
import 'package:find_craft/pages/main_page.dart';
import 'package:find_craft/pages/splash_page.dart';

import 'package:find_craft/route/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final router = Router();
  Routes.configureRoutes(router);
  Application.router = router;

  runApp(BlocProvider<AuthenticationBloc>(
    create: (context) {
      return AuthenticationBloc()..add(AppStarted());
    },
    child: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationAuthenticated) {
          return MaterialApp(home: MainPage());
        }

        if (state is AuthenticationUnauthenticated) {
          return MaterialApp(home: LoginPage());
        }

        return SplashPage();
      },
    );
  }
}

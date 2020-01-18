import 'package:find_craft/application.dart';
import 'package:find_craft/helper/storage_helper.dart';
import 'package:find_craft/pages/authentication/bloc.dart';

import 'package:find_craft/pages/login/login_page.dart';
import 'package:find_craft/pages/splash_page.dart';

import 'package:find_craft/route/routes.dart';
import 'package:find_craft/widgets/simple_bloc_delegate.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

import 'pages/main/main_page.dart';

void main() async {
  final router = Router();
  Routes.configureRoutes(router);
  Application.router = router;
  WidgetsFlutterBinding.ensureInitialized();
  await StorageHelper.init();
  BlocSupervisor.delegate = SimpleBlocDelegate();

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
    return OKToast(
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          Widget _currentHome = SplashPage();

          if (state is AuthenticationAuthenticated) {
            _currentHome = MainPage();
          }

          if (state is AuthenticationUnauthenticated) {
            _currentHome = LoginPage();
          }

          return MaterialApp(
            home: _currentHome,
            onGenerateRoute: Application.router.generator,
          );
        },
      ),
    );
  }
}

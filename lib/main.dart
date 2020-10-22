import 'package:find_craft/application.dart';
import 'package:find_craft/helper/storage_helper.dart';
import 'package:find_craft/pages/authentication/bloc.dart';

import 'package:find_craft/pages/login/login_page.dart';
import 'package:find_craft/pages/splash_page.dart';

import 'package:find_craft/route/routes.dart';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

import 'pages/main/main_page.dart';

void main() async {
  final router = Router();
  Routes.configureRoutes(router);
  Application.router = router;
  WidgetsFlutterBinding.ensureInitialized();
  await StorageHelper.init();

  // 强制竖屏
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

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
      child: MaterialApp(
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationAuthenticated) {
              return MainPage();
            }

            if (state is AuthenticationUnauthenticated) {
              return LoginPage();
            }

            return SplashPage();
          },
        ),
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}

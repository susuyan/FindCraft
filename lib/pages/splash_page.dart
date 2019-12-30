import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  static const String routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash'),
      ),
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}

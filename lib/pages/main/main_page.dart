import 'dart:ui';

import 'package:find_craft/application.dart';
import 'package:find_craft/pages/home/bloc.dart';
import 'package:find_craft/pages/home/home_page.dart';
import 'package:find_craft/pages/main/bloc.dart';
import 'package:find_craft/pages/mine_page.dart';
import 'package:find_craft/route/routes.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:find_craft/widgets/navigation_dot_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget _homePage = HomePage();
  Widget _minePage = MinePage();

  @override
  Widget build(BuildContext context) {
    Widget _selectedPage(MainState state) {
      switch (state.runtimeType) {
        case TabHomeState:
          return BlocProvider(
            create: (context) => HomeBloc(),
            child: _homePage,
          );
        case TabMineState:
          return _minePage;

        default:
          return Container();
      }
    }

    return BlocProvider(
      create: (context) => MainBloc(),
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationDotBar(
              color: Colors.white,
              activeColor: Colors.white,
              backgroundColor: Color(0xFF283254),
              addPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (BuildContext context, _, __) =>
                        BlurImagePage()));
              },
              items: <BottomNavigationDotBarItem>[
                BottomNavigationDotBarItem(
                    icon: Icons.home,
                    onTap: () {
                      BlocProvider.of<MainBloc>(context).add(OnTapHome());
                    }),
                BottomNavigationDotBarItem(icon: IconData(0), onTap: () {}),
                BottomNavigationDotBarItem(
                    icon: Icons.perm_identity,
                    onTap: () {
                      BlocProvider.of<MainBloc>(context).add(OnTapMine());
                    }),
              ],
            ),
            body: _selectedPage(state),
          );
        },
      ),
    );
  }
}

class BlurImagePage extends StatefulWidget {
  @override
  _BlurImagePageState createState() => _BlurImagePageState();
}

class _BlurImagePageState extends State<BlurImagePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xCCFFFFFF),
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 16,
                sigmaY: 16,
              ),
              child: Container(color: Colors.white.withOpacity(0)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: RaisedButton(
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              color: Colors.orangeAccent,
              child: Text(
                '关闭',
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 203),
            child: GestureDetector(
              onTap: () {
                Application.router
                    .navigateTo(context, Routes.workerPublish, replace: true);
              },
              child: Container(
                height: 70,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(35)),
                    gradient: LinearGradient(
                        colors: [Color(0xFF1F8FE5), Color(0xFF3BA7FD)],
                        begin: FractionalOffset(0.5, 0),
                        end: FractionalOffset(0.5, 1))),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Image.asset('assets/images/worker_icon.png'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '发布需求',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text('我要发布用工信息', style: TextStyle(fontSize: 12))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 112),
            child: Container(
              height: 70,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(35)),
                color: Color(0xFF563BFD),
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Image.asset('assets/images/owner_icon.png'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '找个工',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text('我要找个人施工', style: TextStyle(fontSize: 12))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

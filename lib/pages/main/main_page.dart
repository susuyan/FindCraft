import 'dart:ui';

import 'package:find_craft/pages/home/home_page.dart';
import 'package:find_craft/pages/mine/mine_page.dart';
import 'package:find_craft/pages/publish/publish_page.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:find_craft/widgets/navigation_dot_bar.dart';

List<Widget> pages = <Widget>[HomePage(), MinePage()];

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationDotBar(
        color: Colors.white,
        activeColor: Colors.white,
        backgroundColor: Color(0xFF283254),
        addPressed: () {
          Navigator.of(context).push(PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) => PublishPage()));
        },
        items: <BottomNavigationDotBarItem>[
          BottomNavigationDotBarItem(
              icon: Icons.home,
              onTap: () {
                _pageController.jumpToPage(0);
              }),
          BottomNavigationDotBarItem(icon: IconData(0), onTap: () {}),
          BottomNavigationDotBarItem(
              icon: Icons.perm_identity,
              onTap: () {
                _pageController.jumpToPage(1);
              }),
        ],
      ),
      body: PageView.builder(
        itemBuilder: (ctx, index) => pages[index],
        itemCount: pages.length,
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FlatButton(
        onPressed: () {_testLogin();},
        child: Text('按钮'),
      ),
      body: Column(
        children: <Widget>[_createHeader()],
      ),
    );
  }

// 创建头部
  Widget _createHeader() => Stack(
        alignment: Alignment.center,
        overflow: Overflow.visible,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 269,
              child: Image(
                image: AssetImage('assets/images/mine_header_bg.png'),
              ),
            ),
          ),
          Positioned(
            height: 216,
            left: 0,
            right: 0,
            bottom: -59,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero,
                      topRight: Radius.circular(20)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(offset: Offset(0, 5), color: Color(0x33BEBEBE))
                  ]),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: _createSettingsButton(),
            ),
          ),
          Positioned(
            bottom: -31,
            child: FlatButton(
              color: Colors.red,
              onPressed: () {
                print('helloworld');
                _testLogin();
              },
              child: Text('编辑信息'),
            ),
          )
        ],
      );

// 设置按钮
  Widget _createSettingsButton() => Container(
        width: 64,
        height: 31,
        decoration: BoxDecoration(
            color: Color(0xFF3388FF), borderRadius: BorderRadius.circular(8)),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 8,
              left: 9,
              bottom: 8,
              child: Image(
                width: 15,
                height: 15,
                image: AssetImage('assets/images/settings_icon.png'),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text('设置'),
              ),
            )
          ],
        ),
      );

// 编辑信息
  Widget _createEditButton() => FlatButton(
        color: Colors.red,
        onPressed: () {
          print('helloworld');
          _testLogin();
        },
        child: Text('编辑信息'),
      );

  _testLogin() async {
    Dio dio = Dio();
    Response response = await dio.get(
        'http://zhaogegong.beituokj.com/api/employer/',
        queryParameters: {"token": "41a780c48462c401937219496a182a0f"});
    
  }
}

import 'package:find_craft/application.dart';
import 'package:find_craft/common/common_style.dart';
import 'package:find_craft/pages/authentication/bloc.dart';
import 'package:find_craft/pages/mine/bloc.dart';
import 'package:find_craft/repositories/models/mine_models.dart';
import 'package:find_craft/widgets/avatar.dart';
import 'package:find_craft/widgets/craft_tag_view.dart';
import 'package:flutter/material.dart';
import 'package:find_craft/route/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<MineBloc>(
          create: (context) => MineBloc()..add(FetchMine()),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(),
        ),
      ],
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.zero,
            child: BlocBuilder<MineBloc, MineState>(
              builder: (context, state) {
                MineModel mine;

                if (state is LoadedMine) {
                  mine = state.mine;
                }

                if (mine == null) {
                  return Container(
                    child: Center(
                      child: FlatButton(
                        onPressed: () {
                          BlocProvider.of<AuthenticationBloc>(context)
                              .add(LoggedOut());
                        },
                        child: Text('退出登录'),
                      ),
                    ),
                  );
                }

                return ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    _createHeader(mine),
                    Container(
                      height: 69,
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: _createEditButton(),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Text(
                            '施工图',
                            style: CommonStyle.black12,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 34, right: 20, bottom: 17),
                          child: GestureDetector(
                            onTap: () {
                              // Todo: 上传图片
                              Application.router
                                  .navigateTo(context, Routes.workGallery);
                            },
                            child: Image(
                              image:
                                  AssetImage('assets/images/upload_icon.png'),
                            ),
                          ),
                        )
                      ],
                    ),
                    _createWorkGallery()
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

// 创建头部
  Widget _createHeader(MineModel mine) => Stack(
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
            top: 46,
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  color: Color(0x51A0FAaa),
                  borderRadius: BorderRadius.circular(60)),
            ),
          ),
          Positioned(
            height: 157,
            left: 0,
            right: 0,
            bottom: 0,
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
          Positioned(
            bottom: 109,
            child: FLAvatar(
              height: 110,
              width: 110,
              radius: 55,
              color: Colors.blue,
              text: 'TE',
              textStyle: TextStyle(color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 68,
            child: Text(mine.userName),
          ),
          Positioned(
            bottom: 25,
            child: CraftTagsView(
              tags: mine.tags,
            ),
          ),
          // 设置按钮
          Positioned(
            bottom: 110,
            right: 20,
            child: _createSettingsButton(),
          )
        ],
      );

// 设置按钮
  Widget _createSettingsButton() => GestureDetector(
        onTap: () {
          Application.router.navigateTo(context, Routes.settings);
        },
        child: Container(
          width: 64,
          height: 31,
          decoration: BoxDecoration(
              color: Color(0xFF3388FF).withAlpha(20),
              borderRadius: BorderRadius.circular(8)),
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
              Positioned(
                right: 10,
                bottom: 8,
                child: Text(
                  '设置',
                  style: CommonStyle.blue12,
                ),
              )
            ],
          ),
        ),
      );

// 编辑信息
  _createEditButton() => GestureDetector(
        child: Container(
          height: 31,
          width: 84,
          decoration: BoxDecoration(
              color: Color(0xFF3388FF).withAlpha(20),
              borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: Text(
              '编辑信息',
              style: CommonStyle.blue12,
            ),
          ),
        ),
      );

  _createWorkGallery() {
    return SizedBox(
      height: 160,
      child: ListView(
        padding: EdgeInsets.only(left: 20, right: 20),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 8, left: 0),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(8)),
            width: 130,
            height: 170,
          ),
          Container(
            margin: EdgeInsets.only(right: 8, left: 0),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(8)),
            width: 130,
            height: 150,
          ),
          Container(
            margin: EdgeInsets.only(right: 8, left: 0),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(8)),
            width: 130,
            height: 170,
          ),
        ],
      ),
    );
  }
}

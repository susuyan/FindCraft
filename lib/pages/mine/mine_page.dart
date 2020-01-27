import 'package:find_craft/application.dart';
import 'package:find_craft/common/common_style.dart';
import 'package:find_craft/pages/authentication/bloc.dart';
import 'package:find_craft/pages/mine/bloc.dart';
import 'package:find_craft/repositories/models/mine_models.dart';
import 'package:find_craft/widgets/avatar.dart';
import 'package:find_craft/widgets/craft_tag_view.dart';
import 'package:find_craft/widgets/mine_gallery.dart';
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
      ],
      child: Scaffold(
        body: BlocBuilder<MineBloc, MineState>(
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

            return Container(
              child: ListView(
                padding: EdgeInsets.only(top: 0),
                children: <Widget>[
                  _createHeader(mine),
                  // Container(
                  //   color: Colors.white,
                  //   height: 69,
                  //   alignment: Alignment.center,
                  //   child: _createEditButton(),
                  // ),
                  _createSection(),
                  MineGallery()
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _createSection() {
    return Row(
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
          padding: EdgeInsets.only(top: 34, right: 20, bottom: 17),
          child: GestureDetector(
            onTap: () {
              // Todo: 上传图片
              Application.router.navigateTo(context, Routes.workGallery);
            },
            child: Image(
              image: AssetImage('assets/images/upload_icon.png'),
            ),
          ),
        )
      ],
    );
  }

  Widget _createHeader(MineModel mine) => Container(
        height: mine.tags.length != 0 ? 269 : 200,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned.fill(
              child: Image(
                image: AssetImage('assets/images/mine_header_bg.png'),
                fit: BoxFit.fill,
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
            Container(
              margin: EdgeInsets.fromLTRB(0, 112, 0, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero,
                    topRight: Radius.circular(20)),
                color: Colors.white,
              ),
            ),
            // 头像
            Positioned(
              top: 51,
              child: FLAvatar(
                height: 110,
                width: 110,
                radius: 55,
                color: Colors.blue,
                text: mine.tags.length > 0 ? '师傅' : '业主',
                textStyle: TextStyle(color: Colors.white),
              ),
            ),
            // 用户名
            Positioned(
              top: 181,
              child: Text(mine.userName),
            ),
            // 标签
            Positioned(
              bottom: 25,
              child: CraftTagsView(
                tags: mine.tags,
              ),
            ),
            // 设置按钮
            Positioned(
              top: 127,
              right: 20,
              child: _createSettingsButton(),
            )
          ],
        ),
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
}

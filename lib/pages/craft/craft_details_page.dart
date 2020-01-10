import 'package:find_craft/pages/craft/bloc.dart';
import 'package:find_craft/repositories/models/craft_models.dart';
import 'package:find_craft/widgets/avatar.dart';
import 'package:find_craft/widgets/contack_info.dart';
import 'package:find_craft/widgets/craft_tag_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CraftDetailsPage extends StatefulWidget {
  CraftDetailsPage({Key key, @required this.craftId}) : super(key: key);
  final String craftId;

  @override
  _CraftDetailsPageState createState() => _CraftDetailsPageState();
}

class _CraftDetailsPageState extends State<CraftDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CraftBloc()..add(FetchCraftDetails(this.widget.craftId)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('师傅主页'),
        ),
        body: Container(
          color: Colors.white,
          child: BlocBuilder<CraftBloc, CraftState>(
            builder: (context, state) {
              CraftModel craft;
              if (state is LoadedCraftDetails) {
                craft = state.craftDetails;
              }

              if (craft == null) {
                return Container();
              }

              return ListView(
                padding: EdgeInsets.only(bottom: 20),
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: FLAvatar(
                      height: 140,
                      width: 140,
                      radius: 70,
                      color: Colors.blue,
                      text: 'TE',
                      textStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 18, bottom: 30),
                    child: Center(
                      child: Text(craft.userName),
                    ),
                  ),
                  Center(
                    child: CraftTagsView(tags: ['木工', '水电', '吊顶']),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: ContactInfo(
                      icon: Icons.phone,
                      info: craft.userPhone,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: ContactInfo(
                      icon: Icons.phone,
                      info: craft.userWechat,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 30, bottom: 30),
                    child: Text('现场施工图'),
                  ),
                  _createWorkGallery()
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _createWorkGallery() {
    return SizedBox(
      height: 180,
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
            height: 170,
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

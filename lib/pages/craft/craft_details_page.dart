import 'package:find_craft/widgets/avatar.dart';
import 'package:find_craft/widgets/contack_info.dart';
import 'package:find_craft/widgets/craft_tag_view.dart';
import 'package:flutter/material.dart';

class CraftDetailsPage extends StatefulWidget {
  CraftDetailsPage({Key key}) : super(key: key);

  @override
  _CraftDetailsPageState createState() => _CraftDetailsPageState();
}

class _CraftDetailsPageState extends State<CraftDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('师傅主页'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
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
                child: Text('小名'),
              ),
            ),
            Center(
              child: CraftTagsView(tags: ['木工', '水电', '吊顶']),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: ContactInfo(
                icon: Icons.phone,
                info: '1231231',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: ContactInfo(
                icon: Icons.phone,
                info: '1231231',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 30, bottom: 30),
              child: Text('现场施工图'),
            ),
            _createWorkGallery()
          ],
        ),
      ),
    );
  }

  Widget _createWorkGallery() {
    return SizedBox(
      height: 180,
      child: ListView(
        padding: EdgeInsets.only(left: 20,right: 20),
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

import 'package:find_craft/common/common_style.dart';
import 'package:find_craft/widgets/avatar.dart';
import 'package:find_craft/widgets/contack_info.dart';
import 'package:flutter/material.dart';

class DemandDetailsPage extends StatefulWidget {
  DemandDetailsPage({Key key}) : super(key: key);

  @override
  _DemandDetailsPageState createState() =>
      _DemandDetailsPageState();
}

class _DemandDetailsPageState extends State<DemandDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('需求详情'),
      ),
      body: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ListView(
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
              _createDetailsInfo('工作标题', '工作内容'),
              ContactInfo(
                icon: Icons.location_city,
                info: '北京朝阳区',
              ),
              ContactInfo(
                icon: Icons.phone,
                info: '1231231',
              ),
              ContactInfo(
                icon: Icons.access_alarm,
                info: '123123123',
              )
            ],
          )),
    );
  }

  Widget _createDetailsInfo(String title, String info) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFF8F8F8), borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.fromLTRB(20, 20, 20, 30),
      child: Column(
        children: <Widget>[
          Text(title),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              info,
              style: CommonStyle.black12,
            ),
          )
        ],
      ),
    );
  }
}

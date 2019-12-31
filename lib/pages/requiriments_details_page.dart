import 'package:find_craft/common/common_style.dart';
import 'package:find_craft/widgets/avatar.dart';
import 'package:find_craft/widgets/gray_background.dart';
import 'package:flutter/material.dart';

class RequirementsDetailsPage extends StatefulWidget {
  RequirementsDetailsPage({Key key}) : super(key: key);

  @override
  _RequirementsDetailsPageState createState() =>
      _RequirementsDetailsPageState();
}

class _RequirementsDetailsPageState extends State<RequirementsDetailsPage> {
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
              SizedBox(height: 20,),
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

class ContactInfo extends StatefulWidget {
  ContactInfo({this.icon, this.info, Key key}) : super(key: key);
  final IconData icon;
  final String info;
  @override
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  @override
  @override
  Widget build(BuildContext context) {
    return GrayBackground(
      child: Row(
        children: <Widget>[
          Icon(this.widget.icon),
          SizedBox(
            width: 20,
          ),
          Text(
            this.widget.info,
            style: CommonStyle.black12,
          )
        ],
      ),
    );
  }
}

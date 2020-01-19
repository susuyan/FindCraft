import 'package:find_craft/common/common_style.dart';
import 'package:find_craft/pages/demand/bloc.dart';
import 'package:find_craft/repositories/models/demand_models.dart';
import 'package:find_craft/widgets/avatar.dart';
import 'package:find_craft/widgets/contack_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DemandDetailsPage extends StatefulWidget {
  DemandDetailsPage({Key key, @required this.orderId}) : super(key: key);
  final String orderId;

  @override
  _DemandDetailsPageState createState() => _DemandDetailsPageState();
}

class _DemandDetailsPageState extends State<DemandDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DemandBloc()..add(FetchDemandDetails(this.widget.orderId)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('需求详情'),
        ),
        body: Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: BlocBuilder<DemandBloc, DemandState>(
              builder: (context, state) {
                DemandModel demand;
                if (state is LoadedDemandDetails) {
                  demand = state.demandDetails;
                }

                if (demand == null) {
                  return Container();
                }

                return ListView(
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
                        child: Text(demand.userName),
                      ),
                    ),
                    
                    _createDetailsInfo(demand.title, demand.content),
                    ContactInfo(
                      icon: 'assets/images/address_icon.png',
                      info: demand.address,
                    ),
                    ContactInfo(
                      icon: 'assets/images/phone_icon.png',
                      info: demand.userPhone,
                    ),
                    ContactInfo(
                      icon: 'assets/images/wechat_icon.png',
                      info: demand.userWechat,
                    )
                  ],
                );
              },
            )),
      ),
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

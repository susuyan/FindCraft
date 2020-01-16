import 'package:find_craft/application.dart';
import 'package:find_craft/common/common_style.dart';
import 'package:find_craft/pages/publish/bloc.dart';
import 'package:find_craft/widgets/demand_tag.dart';
import 'package:find_craft/widgets/gray_background.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

/// 业主发布
class OwnerPublshPage extends StatefulWidget {
  OwnerPublshPage({Key key}) : super(key: key);

  @override
  _OwnerPublshPageState createState() => _OwnerPublshPageState();
}

class _OwnerPublshPageState extends State<OwnerPublshPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  List<Tag> _seletedTags = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发布'),
      ),
      body: BlocProvider(
        create: (context) => PublishBloc(),
        child:
            BlocListener<PublishBloc, PublishState>(listener: (context, state) {
          if (state is PublishSuccess) {
            showToast("发布成功", context: context);
            Application.router.pop(context);
          }
        }, child: BlocBuilder<PublishBloc, PublishState>(
          builder: (context, state) {
            _publishDemand() {
              BlocProvider.of<PublishBloc>(context).add(PublishDemand(
                  title: _titleController.text,
                  content: _contentController.text,
                  address: _addressController.text,
                  city: '北京'));
            }

            return Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.only(bottom: 40),
                      children: <Widget>[
                        GrayBackground(
                          padding: EdgeInsets.only(left: 15),
                          margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                          child: TextFormField(
                              controller: _titleController,
                              style: CommonStyle.black12,
                              decoration: InputDecoration(
                                hintText: '需求标题',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                                hasFloatingPlaceholder: false,
                                hoverColor: Colors.black,
                                border: InputBorder.none,
                              )),
                        ),
                        GrayBackground(
                          padding: EdgeInsets.only(left: 15),
                          margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                          child: TextFormField(
                              controller: _contentController,
                              style: CommonStyle.black12,
                              decoration: InputDecoration(
                                hintText: '描述你具体的需求',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                                hasFloatingPlaceholder: false,
                                hoverColor: Colors.black,
                                border: InputBorder.none,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30, left: 20),
                          child: Text(
                            '需求类型',
                            style: CommonStyle.gray12,
                          ),
                        ),
                        DemandTag(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          tags: [
                            Tag('找木工'),
                            Tag('找瓦工'),
                            Tag('找水电工'),
                            Tag('维修安装'),
                            Tag('接个人活')
                          ],
                          selectedTags: (list) {
                            _seletedTags = list;
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 20),
                          child: Text(
                            '工作地点',
                            style: CommonStyle.gray12,
                          ),
                        ),
                        GrayBackground(
                          padding:
                              EdgeInsets.only(left: 15, top: 12, bottom: 12),
                          margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                          child: Text('北京'),
                        ),
                        GrayBackground(
                          padding: EdgeInsets.only(left: 15),
                          margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                          child: TextFormField(
                              controller: _addressController,
                              style: CommonStyle.black12,
                              decoration: InputDecoration(
                                hintText: '详细地址',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                                hasFloatingPlaceholder: false,
                                hoverColor: Colors.black,
                                border: InputBorder.none,
                              )),
                        )
                      ],
                    ),
                  ),
                  _publishButton(state is! Publishing ? _publishDemand : null),
                  _cancelButton(() {
                    Application.router.pop(context);
                  }),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          },
        )),
      ),
    );
  }

  Widget _publishButton(Function publish) {
    return GestureDetector(
      onTap: publish,
      child: Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        height: 50,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(
            '立即发布',
            style: CommonStyle.white12,
          ),
        ),
      ),
    );
  }

  Widget _cancelButton(Function cancel) {
    return GestureDetector(
      onTap: cancel,
      child: Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(
            '取消',
            style: CommonStyle.black12,
          ),
        ),
      ),
    );
  }
}

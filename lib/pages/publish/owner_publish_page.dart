import 'package:find_craft/application.dart';
import 'package:find_craft/common/common_style.dart';
import 'package:find_craft/pages/publish/bloc.dart';
import 'package:find_craft/widgets/gray_background.dart';
import 'package:find_craft/widgets/modal_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发布'),
      ),
      body: BlocProvider(
        create: (context) => PublishBloc(),
        child: BlocListener<PublishBloc, PublishState>(
            listener: (context, state) {},
            child: BlocBuilder<PublishBloc, PublishState>(
              builder: (context, state) {
                _publishDemand() {}

                return Container(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView(
                          children: <Widget>[
                            GrayBackground(
                              child: TextFormField(
                                  controller: _titleController,
                                  style: CommonStyle.black12,
                                  decoration: InputDecoration(
                                    hintText: '需求标题',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                    hasFloatingPlaceholder: false,
                                    hoverColor: Colors.black,
                                    border: InputBorder.none,
                                  )),
                            ),
                            GrayBackground(
                              child: TextFormField(
                                  controller: _contentController,
                                  style: CommonStyle.black12,
                                  decoration: InputDecoration(
                                    hintText: '描述你具体的需求',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                    hasFloatingPlaceholder: false,
                                    hoverColor: Colors.black,
                                    border: InputBorder.none,
                                  )),
                            ),
                            Text('需求类型'),
                            Container(),
                            Text('工作地点'),
                            GrayBackground(
                              child: Text('北京'),
                            ),
                            GrayBackground(
                              child: TextFormField(
                                  controller: _addressController,
                                  style: CommonStyle.black12,
                                  decoration: InputDecoration(
                                    hintText: '详细地址',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                    hasFloatingPlaceholder: false,
                                    hoverColor: Colors.black,
                                    border: InputBorder.none,
                                  )),
                            )
                          ],
                        ),
                      ),
                      _publishButton(
                          state is! Publishing ? _publishDemand() : null),
                      _cancelButton(() {
                        Application.router.pop(context);
                      }),
                      SizedBox(
                        height: 40,
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

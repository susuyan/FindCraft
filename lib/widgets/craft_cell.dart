import 'package:flutter/material.dart';

import 'avatar.dart';
import 'craft_tag_view.dart';

class CraftCell extends StatefulWidget {
  @override
  _CraftCellState createState() => _CraftCellState();
}

class _CraftCellState extends State<CraftCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(top: 12, left: 20, right: 20, bottom: 12),
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 13, bottom: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FLAvatar(
                height: 50,
                width: 50,
                radius: 25,
                color: Colors.blue,
                text: 'TE',
                textStyle: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('小名'),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: CraftTagsView(
                          tags: ['木工', '水电', '吊顶'],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text('北京'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
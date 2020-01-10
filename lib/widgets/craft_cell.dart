import 'package:find_craft/common/common_style.dart';
import 'package:find_craft/repositories/models/craft_models.dart';

import 'package:flutter/material.dart';

import 'avatar.dart';
import 'craft_tag_view.dart';

enum CraftCellType { homeCraft, craftList }

class CraftCell extends StatefulWidget {
  const CraftCell(
      {this.craft,
      this.didSelected,
      Key key,
      this.type = CraftCellType.homeCraft})
      : super(key: key);

  final CraftModel craft;
  final Function didSelected;

  final CraftCellType type;

  @override
  _CraftCellState createState() => _CraftCellState();
}

class _CraftCellState extends State<CraftCell> {
  @override
  Widget build(BuildContext context) {
    if (this.widget.craft == null) {
      return Container();
    }

    return GestureDetector(
      onTap: this.widget.didSelected,
      child: Container(
          height: this.widget.type == CraftCellType.homeCraft ? 75 : 100,
          child: this.widget.type == CraftCellType.homeCraft
              ? Container(
                  color: Colors.white,
                  padding:
                      EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: _craftCellBody(),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 7),
                        height: 0.5,
                        color: Color(0x80A0A0A0),
                      )
                    ],
                  ),
                )
              : Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin:
                      EdgeInsets.only(top: 12, left: 20, right: 20, bottom: 12),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 13, bottom: 13),
                    child: _craftCellBody(),
                  ),
                )),
    );
  }

  Widget _craftCellBody() {
    if (this.widget.craft == null) {
      return Container();
    }

    var craft = this.widget.craft;

    var tags = List<String>();
    if (this.widget.craft.type01 != null) {
      tags.add(this.widget.craft.type01);
    }
    if (this.widget.craft.type02 != null) {
      tags.add(this.widget.craft.type01);
    }
    if (this.widget.craft.type03 != null) {
      tags.add(this.widget.craft.type01);
    }
    if (this.widget.craft.type04 != null) {
      tags.add(this.widget.craft.type01);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  craft.userName != null ? craft.userName : '',
                  style: CommonStyle.black12,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.bottomLeft,
                  child: CraftTagsView(
                    tags: tags,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 6),
            alignment: Alignment.topRight,
            child: Text(
              this.widget.craft.city,
              style: CommonStyle.black12,
            ))
      ],
    );
  }
}

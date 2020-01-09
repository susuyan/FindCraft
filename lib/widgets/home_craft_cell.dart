import 'package:find_craft/repositories/models/home_craft_models.dart';
import 'package:flutter/material.dart';

import 'avatar.dart';
import 'craft_tag_view.dart';

class CraftCell extends StatefulWidget {
  const CraftCell({this.craft, this.didSelected, Key key}) : super(key: key);

  final HomeCraftModel craft;
  final Function didSelected;

  @override
  _CraftCellState createState() => _CraftCellState();
}

class _CraftCellState extends State<CraftCell> {
  @override
  Widget build(BuildContext context) {
    if (this.widget.craft == null) {
      return Container();
    }

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

    return GestureDetector(
      onTap: this.widget.didSelected,
      child: Container(
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
                      Text(this.widget.craft.userName),
                      Expanded(
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          child: CraftTagsView(
                            tags: tags,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(this.widget.craft.city),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

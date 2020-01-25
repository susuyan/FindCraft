import 'package:find_craft/common/common_style.dart';
import 'package:flutter/material.dart';

class HomeRecommend extends StatelessWidget {
  const HomeRecommend({this.tags, Key key, this.onPressedTag})
      : super(key: key);
  final List<String> tags;
  final Function(int selectedIndex) onPressedTag;

  @override
  Widget build(BuildContext context) {
    var _boxSize = MediaQuery.of(context).size;
    var _minWidth = (_boxSize.width - 30 - 40) / 3;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: tags
                .asMap()
                .map<int, Widget>((index, tag) {
                  return MapEntry(
                      index,
                      GestureDetector(
                        onTap: () {
                          if (onPressedTag != null) {
                            onPressedTag(index);
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          constraints: BoxConstraints(
                              maxWidth: _minWidth,
                              minWidth: _minWidth,
                              minHeight: 44),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xFF3C4A7C),
                                    Color(0xFF253364)
                                  ])),
                          child: Text(
                            '$tag',
                            style: CommonStyle.white12,
                          ),
                        ),
                      ));
                })
                .values
                .toList(),
          )
        ],
      ),
    );
  }
}

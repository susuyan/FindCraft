import 'package:find_craft/common/common_style.dart';
import 'package:flutter/material.dart';

enum FiltrationType { recommend, latest }

class FiltrationHeader extends StatefulWidget {
  FiltrationHeader({
    Key key,
    this.onSelectCity,
    this.onSelectRecommend,
    this.onSelectLatest,
  }) : super(key: key);
  final Function onSelectCity;
  final Function onSelectRecommend;
  final Function onSelectLatest;

  @override
  _FiltrationHeaderState createState() => _FiltrationHeaderState();
}

class _FiltrationHeaderState extends State<FiltrationHeader> {
  FiltrationType type = FiltrationType.recommend;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        shadowColor: Color(0x1A000000),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0x1A000000),
              height: 1,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 15, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        type = FiltrationType.recommend;
                      });
                      if (widget.onSelectRecommend != null) {
                        widget.onSelectRecommend();
                      }
                    },
                    child: Text('推荐',
                        style: type == FiltrationType.recommend
                            ? CommonStyle.blue12
                            : CommonStyle.black12),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        type = FiltrationType.latest;
                      });
                      if (widget.onSelectLatest != null) {
                        widget.onSelectLatest();
                      }
                    },
                    child: Text('最新',
                        style: type == FiltrationType.latest
                            ? CommonStyle.blue12
                            : CommonStyle.black12),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: widget.onSelectCity,
                    child: Row(
                      children: <Widget>[Text('北京'), Icon(Icons.arrow_right)],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

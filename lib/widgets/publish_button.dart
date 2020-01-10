import 'package:find_craft/common/common_style.dart';
import 'package:flutter/material.dart';

class PublishButton extends StatelessWidget {
  const PublishButton(
      {Key key,
      this.image,
      this.title,
      this.tapPublish,
      this.colors,
      this.color})
      : super(key: key);

  final Image image;
  final String title;
  final Function tapPublish;
  final Color color;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapPublish,
      child: Container(
        height: 70,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(35)),
            color: color,
            gradient: colors != null
                ? LinearGradient(
                    colors: colors,
                    begin: FractionalOffset(0.5, 0),
                    end: FractionalOffset(0.5, 1))
                : null),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 25, right: 10),
              child: image,
            ),
            Text(title, style: CommonStyle.white12)
          ],
        ),
      ),
    );
  }
}

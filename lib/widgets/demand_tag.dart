import 'package:find_craft/common/common_style.dart';
import 'package:flutter/material.dart';

class DemandTag extends StatefulWidget {
  DemandTag({
    Key key,
    this.tags,
    this.onPressedTag,
    this.selectedTags,
  }) : super(key: key);

  final List<Tag> tags;
  final Function onPressedTag;

  final Function(List<Tag>) selectedTags;

  @override
  _DemandTagState createState() => _DemandTagState();
}

class Tag {
  Tag(this.title, {this.isSelected = false});
  bool isSelected;
  final String title;
}

class _DemandTagState extends State<DemandTag> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            children: widget.tags
                .asMap()
                .map<int, Widget>((index, tag) {
                  return MapEntry(
                      index,
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tag.isSelected = !tag.isSelected;
                            if (widget.selectedTags != null) {
                              widget.selectedTags(
                                  widget.tags.where((tag) => tag.isSelected));
                            }
                          });
                        },
                        child: TagItem(
                          tag: tag,
                        ),
                      ));
                })
                .values
                .toList(),
          ),
        ],
      ),
    );
  }
}

class TagItem extends StatelessWidget {
  const TagItem({Key key, @required this.tag}) : super(key: key);
  final Tag tag;

  @override
  Widget build(BuildContext context) {
    var _boxSize = MediaQuery.of(context).size;
    var _minWidth = (_boxSize.width - 30 - 40) / 3;
    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(
          maxWidth: _minWidth, minWidth: _minWidth, minHeight: 44),
      decoration: BoxDecoration(
          color: Colors.white,
          border: tag.isSelected ? null : Border.all(color: Color(0xFF8D9DB5)),
          borderRadius: BorderRadius.circular(5),
          gradient: tag.isSelected
              ? LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF3C4A7C), Color(0xFF253364)])
              : null),
      child: Text(
        tag.title,
        style: tag.isSelected
            ? CommonStyle.white12
            : TextStyle(color: Color(0xFF8D9DB5), fontSize: 12),
      ),
    );
  }
}

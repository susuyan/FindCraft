import 'package:find_craft/common/common_style.dart';
import 'package:flutter/material.dart';

class Tag {
  Tag(this.title, {this.type,this.isSelected = false});
  bool isSelected;
  final String title;
  final String type;
}

class DemandTagContrller extends ValueNotifier<List<Tag>> {
  List<Tag> get selectedTags => value;
  DemandTagContrller({List<Tag> tags}) : super(tags == null ? List() : tags);
}

class DemandTag extends StatefulWidget {
  DemandTag({
    Key key,
    this.tags,
    this.padding = EdgeInsets.zero,
    this.contrller,
  }) : super(key: key);
  final EdgeInsets padding;
  final List<Tag> tags;
  final DemandTagContrller contrller;

  List<Tag> get _selectedTags => tags.where((item) {
        return item.isSelected;
      }).toList();



  @override
  _DemandTagState createState() => _DemandTagState();
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
      padding: widget.padding,
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
                            if (widget.contrller != null) {
                              widget.contrller.value = widget._selectedTags;
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

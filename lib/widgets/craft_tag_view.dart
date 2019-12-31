import 'package:flutter/material.dart';

/// 师傅技能标签
class CraftTagsView extends StatelessWidget {
  const CraftTagsView({Key key, this.tags}) : super(key: key);

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      children: tags.map<Widget>((tag) {
        return Container(
          padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
          decoration: BoxDecoration(
              color: Color(0xFF8D9DB5), borderRadius: BorderRadius.circular(3)),
          child: Text(
            '$tag',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        );
      }).toList(),
    );
  }
}
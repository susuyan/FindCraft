import 'package:find_craft/common/common_style.dart';
import 'package:flutter/material.dart';

class CraftCategoryView extends StatefulWidget {
  const CraftCategoryView(this.categories, {Key key, this.selectedIndex = 0})
      : super(key: key);
  final List<String> categories;
  final int selectedIndex;

  @override
  _CraftCategoryViewState createState() => _CraftCategoryViewState();
}

class _CraftCategoryViewState extends State<CraftCategoryView> {
  int _seletedIndex;
  @override
  void initState() {
    super.initState();
    _seletedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 65,
        padding: EdgeInsets.only(top: 15, bottom: 15, left: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: this.widget.categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _seletedIndex = index;
                });
              },
              child: Container(
                margin: EdgeInsets.only(left: 10),
                constraints: BoxConstraints(minWidth: 74, minHeight: 35),
                decoration: BoxDecoration(
                    color: _seletedIndex == index
                        ? Color(0xFF253364)
                        : Color(0xFF8D9DB5),
                    borderRadius: BorderRadius.circular(20)),
                alignment: Alignment.center,
                child: Text(
                  this.widget.categories[index],
                  style: CommonStyle.white12,
                ),
              ),
            );
          },
        ));
  }
}

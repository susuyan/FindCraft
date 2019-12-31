import 'package:find_craft/common/common_style.dart';
import 'package:flutter/material.dart';

class WorkGalleryPage extends StatefulWidget {
  WorkGalleryPage({Key key}) : super(key: key);

  @override
  _WorkGalleryPageState createState() => _WorkGalleryPageState();
}

class _WorkGalleryPageState extends State<WorkGalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('施工图管理'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  children: List.generate(100, (index) {
                    return Center(
                      child: Container(
                        color: Colors.redAccent,
                      ),
                    );
                  })),
            ),
            UploadButton()
          ],
        ),
      ),
    );
  }
}

class UploadButton extends StatefulWidget {
  const UploadButton({this.uploadPressd, Key key}) : super(key: key);
  final Function uploadPressd;

  @override
  _UploadButtonState createState() => _UploadButtonState();
}

class _UploadButtonState extends State<UploadButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.widget.uploadPressd,
      child: Container(
        height: 54,
        width: double.infinity,
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(14, 14, 14, 14),
        decoration: BoxDecoration(color: Color(0xFF207DFF),borderRadius: BorderRadius.circular(29)),
        child: Text('上传施工图', style: CommonStyle.white12),
      ),
    );
  }
}

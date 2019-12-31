import 'package:find_craft/application.dart';
import 'package:flutter/material.dart';

/// 工人发布
class WorkerPublishPage extends StatefulWidget {
  WorkerPublishPage({Key key}) : super(key: key);

  @override
  _WorkerPublishPageState createState() => _WorkerPublishPageState();
}

class _WorkerPublishPageState extends State<WorkerPublishPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Dismissible(
      direction: DismissDirection.vertical,
      key: Key('key'),
      onDismissed: (direction) {
        Navigator.of(context).pop();
      },
      child: Center(
        child: FlatButton(
          onPressed: () {
            Application.router.pop(context);
          },
          child: Text('返回'),
        ),
      ),
    ));
  }
}

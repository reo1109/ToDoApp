import 'package:flutter/material.dart';
import 'package:todo/utils/widget_utils.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils.createAppBar('詳細'),
      body: ListView(
        children: [
          Container(
            height: 50,
            child: Text('hello'),
          )
        ],
      ),
    );
  }
}

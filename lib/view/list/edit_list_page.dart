import 'package:flutter/material.dart';
import 'package:todo/utils/widget_utils.dart';

class EditListPage extends StatefulWidget {
  const EditListPage({Key? key}) : super(key: key);

  @override
  State<EditListPage> createState() => _EditListPageState();
}

class _EditListPageState extends State<EditListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils.createAppBar('リストの編集'),
    );
  }
}

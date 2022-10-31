import 'package:flutter/material.dart';
import 'package:todo/model/list.dart';
import 'package:todo/utils/widget_utils.dart';

class AddListPage extends StatefulWidget {
  const AddListPage({Key? key}) : super(key: key);

  @override
  State<AddListPage> createState() => _AddListPageState();
}

class _AddListPageState extends State<AddListPage> {
  var i = 1;
  DateTime? _selectedDate;
  TextEditingController contentController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();
  TextEditingController remarksController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils.createAppBar('リストの追加'),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
          SizedBox(height: 50,),
            Container(
              width: 300,
              child: TextField(
                controller: contentController,
                decoration: InputDecoration(
                hintText: 'To Do'
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Container(
                width: 300,
                child: Column(
                  children: [
                    TextField(
                      controller: remarksController,
                      decoration: InputDecoration(
                          hintText: '備考'
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 300,
              child: Column(
                children: [
                  TextField(
                    controller: deadlineController,
                    decoration: InputDecoration(
                        hintText: '${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}/${DateTime.now().hour}'
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      icon: Icon(Icons.calendar_today))
                ],
              ),

            ),
            ElevatedButton(
                onPressed: () {
                  if(contentController.text.isNotEmpty) {
                    Todo newTodo = Todo(
                        toDoId: i++,
                        content: contentController.text,
                        remarks: remarksController.text,
                        deadLine: _selectedDate,
                        createdTime: DateTime.now(),
                        checkBox: false
                    );

                    Navigator.of(context).pop(newTodo);
                  }

                },
                child: Text('リスト追加')
            )
          ]
        ),
      ),
    );
  }
  _selectDate(BuildContext context) async {
    final newSelectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      deadlineController.text = _selectedDate.toString();
    }
  }
}

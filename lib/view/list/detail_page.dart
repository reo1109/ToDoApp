import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/model/list.dart';
import 'package:todo/utils/widget_utils.dart';

class DetailPage extends StatefulWidget {
  Todo todoList;

  DetailPage({Key? key, required this.todoList}) : super(key: key);

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
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50, width: double.infinity,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25, width: 30,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          width: 80,
                          color: Colors.amber,
                          child: Center(
                            child: Text('Todo',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 30),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(widget.todoList.content,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50, width: double.infinity,),
                Row(
                  children: [
                    SizedBox(height: 25, width: 30,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          width: 80,
                          color: Colors.amber,
                          child: Center(
                            child: Text('〆切',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 30,),
                    Text(DateFormat('M月d日h時m分').format(widget.todoList.deadLine!),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(height: 50, width: double.infinity,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25, width: 30,),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.0),
                          width: 80,
                          color: Colors.amber,
                          child: Center(
                            child: Text('備考',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 30),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(widget.todoList.remarks,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}

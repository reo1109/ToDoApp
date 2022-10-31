import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/model/list.dart';
import 'package:todo/utils/widget_utils.dart';
import 'package:todo/view/list/add_llist_page.dart';
import 'package:todo/view/list/detail_page.dart';
import 'package:todo/view/list/edit_list_page.dart';


class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  List<Todo> todoList = [];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils.createAppBar('リスト一覧'),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'メニュー',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('リストの編集'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditListPage()));
              }
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('過去のリスト'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('設定'),
            ),
          ],
        ),
      ),

      body: Stack(
        children: <Widget>[
          Container(
            height: 620,
            child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      border: index == 0 ? Border(
                        top: BorderSide(color: Colors.grey, width: 1),
                        bottom: BorderSide(color: Colors.grey, width: 1),
                      ): Border(bottom: BorderSide(color: Colors.grey, width: 1),)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(
                            value: todoList[index].checkBox,
                            onChanged: (value) {
                              setState(() {
                                todoList[index].checkBox = value!;
                              });
                            },
                          ),
                          Text(todoList[index].content, style: TextStyle(fontSize: 20),),
                          ElevatedButton(
                              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));},
                              child: Text('詳細')),
                        ],
                      ),
                      Text(DateFormat('〆切: M月d日h時m分').format(todoList[index].deadLine!), style: TextStyle(fontSize: 10),),
                    ],
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: null,
                child: Text('確定'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 50),
                ),
              )
          )
        ]
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Todo newList = await Navigator.push(context, MaterialPageRoute(builder: (context) => AddListPage())) as Todo;

          setState(() {
            todoList.add(newList);
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}

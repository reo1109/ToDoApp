class Todo {
  int toDoId;
  String content;
  String remarks;
  DateTime? deadLine;
  DateTime? createdTime;
  bool? checkBox;

  Todo({this.toDoId = 0, this.content = '',this.remarks = '',  this.createdTime, this.deadLine, this.checkBox });
}
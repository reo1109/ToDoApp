class toDo {
  String toDoId;
  String content;
  String remarks;
  DateTime? deadLine;
  DateTime? createdTime;
  bool? checkBox;

  toDo({this.toDoId = '', this.content = '',this.remarks = '',  this.createdTime, this.deadLine, this.checkBox });
}
import 'package:equatable/equatable.dart';

class TaskModel  extends Equatable{
  final int? id;
  final String title;
  final String content;
  final String? date;
  final String? time;
  //is todo: done or not normal or important
     String? status;


  TaskModel(
      {this.id,
        required this.title,
        required this.content,
        this.date,
        this.time,
        this.status});




  TaskModel copyWith({
    int? id,
    String? title,
    String? content,
    String? date,
    String? time,
    String? status,
  }) {
    return  TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      date: date ?? this.date,
      time: time ?? this.time,
      status: status ?? this.status,
    );
  }



  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map["id"] ,
      title: map["title"],
      content: map["content"],
      date: map["date"],
      time: map["time"],
      status: map["status"],

    );
  }


  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();

    map["id"] = id;
    map["title"] = title;
    map["content"] = content;
    map["date"] = date;
    map["time"] = time;
    map["status"] = status;

    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id,title,content,date,time,status];


  @override
  String toString() {
    return 'Todo {id: $id, status: $status, content: $content, title: $title, date:$date, time: $time }';
  }
}



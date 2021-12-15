import 'package:equatable/equatable.dart';

class Task extends Equatable {
  //id of task
  int id;
  //the content of the task
  String text;
  //is task completed ?
  bool isCompleted;

  Task(
    this.id,
    this.text,
    this.isCompleted,
  );

  @override
  List<Object> get props {
    return [
      id,
      text,
      isCompleted,
    ];
  }

  @override
  bool get stringify => true;
}

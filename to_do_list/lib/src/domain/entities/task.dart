import 'package:equatable/equatable.dart';

class Task extends Equatable {
  //id of task
  final int id;
  //the content of the task
  final String text;
  //is task completed ?
  final bool isCompleted;

  const Task(
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

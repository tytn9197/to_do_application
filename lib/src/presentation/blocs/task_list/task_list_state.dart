part of 'task_list_cubit.dart';

class TaskListState extends Equatable {
  //list of Tasks
  List<Task> tasks;

  TaskListState(this.tasks);

  @override
  List<Object> get props => [tasks];
}

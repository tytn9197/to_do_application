import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_list/src/data/tasks.dart';
import 'package:to_do_list/src/domain/entities/task.dart';

part 'task_list_state.dart';

class TaskListCubit extends Cubit<TaskListState> {
  TaskListCubit() : super(TaskListState(Tasks));

  void getAllTasks() {
    emit(TaskListState([...Tasks]));
  }

  void getCompletedTask() {
    List<Task> completedTasks = [...Tasks.where((task) => task.isCompleted)];
    emit(TaskListState(completedTasks));
  }

  void getIncompletedTask() {
    List<Task> incompleteTasks = [...Tasks.where((task) => !task.isCompleted)];
    emit(TaskListState(incompleteTasks));
  }

  void createTask(Task task) {
    Tasks.add(task);
    emit(TaskListState([...Tasks]));
  }
}

import 'package:test/test.dart';
import 'package:to_do_list/src/data/tasks.dart';
import 'package:to_do_list/src/domain/entities/task.dart';
import 'package:to_do_list/src/presentation/blocs/task_list/task_list_cubit.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  //List of init tasks
  late List<Task> initTasks;

  setUp(() {
    //init new array of tasks from Data
    initTasks = [...Tasks];
  });

  blocTest<TaskListCubit, TaskListState>("get all tasks",
      build: () => TaskListCubit(),
      act: (bloc) => bloc.getAllTasks(),
      expect: () {
        return [TaskListState(Tasks)];
      });

  blocTest<TaskListCubit, TaskListState>("get completed tasks",
      build: () => TaskListCubit(),
      act: (bloc) => bloc.getCompletedTask(),
      expect: () {
        TaskListState newTasks = TaskListState(initTasks);
        newTasks.tasks = Tasks.where((t) => t.isCompleted).toList();
        return [newTasks];
      });

  blocTest<TaskListCubit, TaskListState>("get incomplete tasks",
      build: () => TaskListCubit(),
      act: (bloc) => bloc.getIncompletedTask(),
      expect: () {
        TaskListState newTasks = TaskListState(initTasks);
        newTasks.tasks = Tasks.where((t) => !t.isCompleted).toList();
        return [newTasks];
      });

  //mock task to create new task
  Task task = Task(111, 'Testing task', false);

  blocTest<TaskListCubit, TaskListState>("Add new task",
      build: () => TaskListCubit(),
      act: (bloc) => bloc.createTask(task),
      expect: () {
        TaskListState newTasks = TaskListState(initTasks);
        newTasks.tasks.add(task);
        return [newTasks];
      });
}

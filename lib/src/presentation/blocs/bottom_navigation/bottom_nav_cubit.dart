import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_list/src/data/tasks.dart';
import 'package:to_do_list/src/domain/entities/task.dart';
import 'constants/bottom_nav_items.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavState(BottomNavItems.all, 0, Tasks));

  void setBottomNavItem(BottomNavItems navItems) {
    switch (navItems) {
      case BottomNavItems.all:
        emit(BottomNavState(BottomNavItems.all, 0, Tasks));
        break;
      case BottomNavItems.complete:
        List<Task> completedTasks = [...Tasks.where((task) => task.isCompleted)];
        emit(BottomNavState(BottomNavItems.complete, 1, completedTasks));
        break;
      case BottomNavItems.incomplete:
        List<Task> incompleteTasks = [...Tasks.where((task) => !task.isCompleted)];
        emit(BottomNavState(BottomNavItems.incomplete, 2, incompleteTasks));
        break;
    }
  }
}
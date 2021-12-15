part of 'bottom_nav_cubit.dart';

class BottomNavState extends Equatable {
  //Bottom navigation name
  BottomNavItems items;
  //Bottom navigation index
  int index;
  //list of Tasks
  List<Task> tasks;

  BottomNavState(this.items, this.index, this.tasks);

  @override
  List<Object> get props => [items, index, tasks];
}

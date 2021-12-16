part of 'bottom_nav_cubit.dart';

class BottomNavState extends Equatable {
  //Bottom navigation name
  BottomNavItems items;
  //Bottom navigation index
  int index;

  BottomNavState(this.items, this.index);

  @override
  List<Object> get props => [items, index];
}

part of 'bottom_nav_cubit.dart';

class BottomNavState extends Equatable {
  //Bottom navigation name
  final BottomNavItems items;
  //Bottom navigation index
  final int index;

  const BottomNavState(this.items, this.index);

  @override
  List<Object> get props => [items, index];
}

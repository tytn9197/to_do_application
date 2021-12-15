import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'constants/bottom_nav_items.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavState(BottomNavItems.all, 0));

  void setBottomNavItem(BottomNavItems navItems) {
    switch (navItems) {
      case BottomNavItems.all:
        emit(BottomNavState(BottomNavItems.all, 0));
        break;
      case BottomNavItems.complete:
        emit(BottomNavState(BottomNavItems.complete, 1));
        break;
      case BottomNavItems.incomplete:
        emit(BottomNavState(BottomNavItems.incomplete, 2));
        break;
    }
  }
}
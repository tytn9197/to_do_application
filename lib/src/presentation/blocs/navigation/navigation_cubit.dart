import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'constants/nav_bar_items.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavbarItem.all, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.all:
        emit(NavigationState(NavbarItem.all, 0));
        break;
      case NavbarItem.complete:
        emit(NavigationState(NavbarItem.complete, 1));
        break;
      case NavbarItem.incomplete:
        emit(NavigationState(NavbarItem.incomplete, 2));
        break;
    }
  }
}
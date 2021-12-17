import 'package:test/test.dart';
import 'package:to_do_list/src/presentation/blocs/bottom_navigation/bottom_nav_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:to_do_list/src/presentation/blocs/bottom_navigation/constants/bottom_nav_items.dart';

void main() {
  blocTest<BottomNavCubit, BottomNavState>('navigate to "All" screen',
      build: () => BottomNavCubit(),
      act: (bloc) => bloc.setBottomNavItem(BottomNavItems.all),
      expect: () {
        return [BottomNavState(BottomNavItems.all, 0)];
      });

  blocTest<BottomNavCubit, BottomNavState>('navigate to "Complete" screen',
      build: () => BottomNavCubit(),
      act: (bloc) => bloc.setBottomNavItem(BottomNavItems.complete),
      expect: () {
        return [BottomNavState(BottomNavItems.complete, 1)];
      });

  blocTest<BottomNavCubit, BottomNavState>('navigate to "Icomplete" screen',
      build: () => BottomNavCubit(),
      act: (bloc) => bloc.setBottomNavItem(BottomNavItems.incomplete),
      expect: () {
        return [BottomNavState(BottomNavItems.incomplete, 2)];
      });
}

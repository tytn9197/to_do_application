import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/src/presentation/blocs/bottom_navigation/bottom_nav_cubit.dart';
import 'package:to_do_list/src/presentation/blocs/bottom_navigation/constants/bottom_nav_items.dart';

class BottomNavWidget extends StatelessWidget {
  BottomNavWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            items: bottomNavItems,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.black,
            showUnselectedLabels: true,
            currentIndex: state.index,
            onTap: (index) {
              if (index == 0) {
                BlocProvider.of<BottomNavCubit>(context)
                    .setBottomNavItem(BottomNavItems.all);
              } else if (index == 1) {
                BlocProvider.of<BottomNavCubit>(context)
                    .setBottomNavItem(BottomNavItems.complete);
              } else if (index == 2) {
                BlocProvider.of<BottomNavCubit>(context)
                    .setBottomNavItem(BottomNavItems.incomplete);
              }
            },
          ),
        );
      },
    );
  }

  List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.list_alt_rounded),
        label: 'All'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.check_box_outlined),
        label: 'Complete'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.check_box_outline_blank_outlined),
        label: 'Incomplete'
    )
  ];
}

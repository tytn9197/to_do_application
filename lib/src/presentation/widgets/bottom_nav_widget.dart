import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/src/presentation/blocs/bottom_navigation/bottom_nav_cubit.dart';
import 'package:to_do_list/src/presentation/blocs/bottom_navigation/constants/bottom_nav_items.dart';
import 'package:to_do_list/src/presentation/blocs/task_list/task_list_cubit.dart';

class BottomNavWidget extends StatelessWidget {
  //to know current index of bottom navigation
  final Function(int) getIndex;

  BottomNavWidget({Key? key, required this.getIndex}) : super(key: key);

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
              this.getIndex(index);
              if (index == 0) {
                BlocProvider.of<BottomNavCubit>(context)
                    .setBottomNavItem(BottomNavItems.all);
                BlocProvider.of<TaskListCubit>(context)
                    .getAllTasks();
              } else if (index == 1) {
                BlocProvider.of<BottomNavCubit>(context)
                    .setBottomNavItem(BottomNavItems.complete);
                BlocProvider.of<TaskListCubit>(context)
                    .getCompletedTask();
              } else if (index == 2) {
                BlocProvider.of<BottomNavCubit>(context)
                    .setBottomNavItem(BottomNavItems.incomplete);
                BlocProvider.of<TaskListCubit>(context)
                    .getIncompletedTask();
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

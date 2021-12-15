import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/src/presentation/blocs/bottom_navigation/bottom_nav_cubit.dart';
import 'package:to_do_list/src/presentation/blocs/bottom_navigation/constants/bottom_nav_items.dart';
import 'package:to_do_list/src/presentation/widgets/task_widget.dart';
import 'package:to_do_list/src/utils/constants/constants.dart';
import 'package:sizer/sizer.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
          child: Column(
            children: [
              headerOfBody(),
              TaskWidget(isCompleted: true, text: 'Do my homework'),
            ],
      )),
      //extend the body below a bottom navigation bar
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.playlist_add_outlined, color: Colors.black),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget bodyContent() {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
      if (state.items == BottomNavItems.all) {
        return Text('all');
      } else if (state.items == BottomNavItems.complete) {
        return Text('complete');
      } else if (state.items == BottomNavItems.incomplete) {
        return Text('incomplete');
      }
      return Container();
    });
  }

  Widget headerOfBody() {
    return Stack(
      children: [
        Image(
          image: AssetImage('assets/images/header.png'),
          height: 11.h,
          width: 100.w,
          fit: BoxFit.fill,
        ),
        Center(
            child: SafeArea(
                child: Container(
                  color: Colors.grey,
                  margin: EdgeInsets.only(top: 1.h),
                  child: Text(
                    'ToDoApp',
                    style: TextStyle(
                        fontSize: 3.h,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Butler',
                        color: kTitleTextColor
                    ),
                  ),
        ))),
      ],
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

  onBottomNavTab(index) {
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
  }

  Widget bottomNavigationBar() {
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
            onTap: onBottomNavTab,
          ),
        );
      },
    );
  }
}

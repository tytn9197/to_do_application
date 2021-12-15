import 'package:flutter/material.dart';
import 'package:to_do_list/src/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/src/presentation/blocs/bottom_navigation/bottom_nav_cubit.dart';
import 'package:to_do_list/src/presentation/blocs/bottom_navigation/constants/bottom_nav_items.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: bodyContent(),
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
    return Center(child: Container(
      child: BlocBuilder<BottomNavCubit, BottomNavState>(
          builder: (context, state) {
        if (state.items == BottomNavItems.all) {
          return Text('all');
        } else if (state.items == BottomNavItems.complete) {
          return Text('complete');
        } else if (state.items == BottomNavItems.incomplete) {
          return Text('incomplete');
        }
        return Container();
      }),
    ));
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
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt_rounded), label: 'All'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.check_box_outlined), label: 'Complete'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.check_box_outline_blank_outlined), label: 'Incomplete')
            ],
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
}

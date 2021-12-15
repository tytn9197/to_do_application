import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/src/data/tasks.dart';
import 'package:to_do_list/src/domain/entities/task.dart';
import 'package:to_do_list/src/presentation/blocs/bottom_navigation/bottom_nav_cubit.dart';
import 'package:to_do_list/src/presentation/blocs/bottom_navigation/constants/bottom_nav_items.dart';
import 'package:to_do_list/src/presentation/widgets/bottom_nav_widget.dart';
import 'package:to_do_list/src/presentation/widgets/tasks_list_widget.dart';
import 'package:to_do_list/src/utils/constants/colors.dart';
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
          child: Column(children: [
              header(),
              bodyContent(),
        ],
      )),
      //extend the body below a bottom navigation bar
      extendBody: true,
      bottomNavigationBar: BottomNavWidget(),
    );
  }

  BoxDecoration buttonBoxDecoration = BoxDecoration(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: kShadowColor,
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      color: kButtonColor);

  Widget bodyContent() {
    return Column(
      children: [
        //create button
        Container(
            width: 100.w,
            height: 8.h,
            margin: EdgeInsets.symmetric(horizontal: 6.w),
            decoration: buttonBoxDecoration,
            child: TextButton(
                style: TextButton.styleFrom(alignment: Alignment.center),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 1.w),
                      child: Text(
                        'Create',
                        style: TextStyle(
                            fontSize: 2.5.h,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Icon(Icons.playlist_add_rounded,
                        color: Colors.white, size: 3.5.h),
                  ],
                ))),
        // list of tasks
        BlocBuilder<BottomNavCubit, BottomNavState>(builder: (context, state) {
          if (state.items == BottomNavItems.complete) {
            return TasksList(tasks: state.tasks);
          } else if (state.items == BottomNavItems.incomplete) {
            return TasksList(tasks: state.tasks);
          }

          //default return all tasks
          return TasksList(tasks: state.tasks);
        }),
      ],
    );
  }

  Widget header() {
    return Stack(
      children: [
        //header image
        Image(
          image: AssetImage('assets/images/header.png'),
          height: 15.h,
          width: 100.w,
          fit: BoxFit.fill,
        ),
        //application name
        Center(
            child: SafeArea(
                child: Container(
                  margin: EdgeInsets.only(top: 1.h),
                  child: Text(
                    'ToDoApp',
                    style: TextStyle(
                        fontSize: 4.h,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Butler',
                        color: kTitleTextColor),
                  ),
        ))),
      ],
    );
  }
}

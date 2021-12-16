import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/src/presentation/blocs/bottom_navigation/bottom_nav_cubit.dart';
import 'package:to_do_list/src/presentation/widgets/bottom_nav_widget.dart';
import 'package:to_do_list/src/presentation/widgets/button_widget.dart';
import 'package:to_do_list/src/presentation/widgets/task_widget.dart';
import 'package:to_do_list/src/utils/constants/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:to_do_list/src/utils/constants/styles.dart';

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

  onCreateNewTask () {
    Navigator.of(context).restorablePush(_dialogBuilder);
  }
  static Route<Object?> _dialogBuilder(
      BuildContext context, Object? arguments) {
    return DialogRoute<void>(
      context: context,
      builder: (BuildContext context) =>
      AlertDialog(
        content: Container(
          height: 30.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("New task", style: kTitleStyle,),
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your task'
                ),
              ),
              ButtonWidget(
                text: 'JUST DO IT!',
                width: 100.w,
                height: 6.h,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                icon: Icons.arrow_right_alt,
                onPress: (){print('pressed');},
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget bodyContent() {
    return Column(
      children: [
        //button CREATE
        ButtonWidget(
          text: 'Create',
          width: 100.w,
          height: 8.h,
          margin: EdgeInsets.symmetric(horizontal: 6.w),
          icon: Icons.playlist_add_rounded,
          onPress: onCreateNewTask,
        ),
        // list of tasks
        BlocBuilder<BottomNavCubit, BottomNavState>(
          builder: (context, state) {
            return Container(
              height: 65.h,
              child: ListView.builder(
                itemCount: state.tasks.length,
                itemBuilder: (context, index) {
                  return TaskWidget(
                    task: state.tasks[index],
                  );
                },
              ),
            );
          },
        )
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
                    style: kTitleStyle,
                  ),
                ))),
      ],
    );
  }
}

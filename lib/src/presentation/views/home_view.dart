import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/src/presentation/blocs/task_list/task_list_cubit.dart';
import 'package:to_do_list/src/presentation/widgets/bottom_nav_widget.dart';
import 'package:to_do_list/src/presentation/widgets/button_widget.dart';
import 'package:to_do_list/src/presentation/widgets/loading_widget.dart';
import 'package:to_do_list/src/presentation/widgets/task_dialog_widget.dart';
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
  //for loading page
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    initData();
  }
  void initData() async{
    BlocProvider.of<TaskListCubit>(context)
        .getAllTasks();
    await Future.delayed(Duration(milliseconds: 1500));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading?
    //loading page with circle spinkit
    LoadingWidget()
        :
    Scaffold(
      resizeToAvoidBottomInset: false,
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
    //open dialog to create new task
    showAlertDialog(context);
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
        BlocBuilder<TaskListCubit, TaskListState>(
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

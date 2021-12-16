import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:to_do_list/src/domain/entities/task.dart';
import 'package:to_do_list/src/presentation/blocs/bottom_navigation/bottom_nav_cubit.dart';
import 'package:to_do_list/src/presentation/blocs/bottom_navigation/constants/bottom_nav_items.dart';
import 'package:to_do_list/src/presentation/blocs/task_list/task_list_cubit.dart';
import 'package:to_do_list/src/presentation/widgets/button_widget.dart';
import 'package:to_do_list/src/utils/constants/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

showAlertDialog(BuildContext context) {
  // show the CREATE TASK dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      //to verify task content
      bool isError = false;

      //get text from text field of creating new task
      final txtTaskController = TextEditingController();

      return StatefulBuilder(
        builder: (context, setState) {

          return AlertDialog(
              content: Container(
                height: 30.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "New task",
                      style: kTitleStyle,
                    ),
                    TextField(
                      controller: txtTaskController,
                      onChanged: (text) {
                        if (text.isEmpty) {
                          setState(() => isError = true);
                        } else {
                          setState(() => isError = false);
                        }
                      },
                      maxLength: 50,
                      decoration: InputDecoration(
                          errorText: isError ? "Can't be null" : null,
                          border: OutlineInputBorder(),
                          hintText: 'Enter your task'),
                    ),
                    ButtonWidget(
                      text: 'JUST DO IT!',
                      width: 100.w,
                      height: 6.h,
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      icon: Icons.arrow_right_alt,
                      onPress: isError? () {} : () {
                        if (txtTaskController.text.isEmpty) {
                          setState(() => isError = true);
                        } else {
                          BlocProvider.of<TaskListCubit>(context)
                              .createTask(Task(11, txtTaskController.text, false));
                          BlocProvider.of<BottomNavCubit>(context)
                              .setBottomNavItem(BottomNavItems.all);
                          Navigator.pop(context, 'Cancel');
                        }
                      },
                    ),
                  ],
                ),
              ));
        }
      );
    },
  );
}

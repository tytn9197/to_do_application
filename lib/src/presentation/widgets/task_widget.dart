import 'package:flutter/material.dart';
import 'package:to_do_list/src/domain/entities/task.dart';
import 'package:to_do_list/src/utils/constants/colors.dart';
import 'package:sizer/sizer.dart';

class TaskWidget extends StatefulWidget {
  //receiving task from list.builder in home_view
  final Task task;
  final Function() onTaskTap;

  const TaskWidget({Key? key, required this.task, required this.onTaskTap})
      : super(key: key);

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    BoxDecoration taskBoxDecoration = BoxDecoration(
        border: Border.all(color: widget.task.isCompleted ? kCheckBoxColor : Colors.white),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: kShadowColor,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white);

    Widget renderCheckBox() {
      return Container(
          padding: EdgeInsets.all(2.w),
          child: widget.task.isCompleted
              ? Icon(
                  Icons.check_box,
                  color: kCheckBoxColor,
                  size: 3.5.h)
              : Icon(
                  Icons.check_box_outline_blank_outlined,
                  color: Colors.black12,
                  size: 3.5.h)
      );
    }

    return GestureDetector(
      onTap: widget.onTaskTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 6.w),
        padding: EdgeInsets.all(1.w),
        decoration: taskBoxDecoration,
        child: Center(
          child: Row(
            children: [
              renderCheckBox(),
              Expanded(
                child: Text(
                  '${widget.task.text}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(color: Colors.black, fontSize: 2.h, fontFamily: 'IBM'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
